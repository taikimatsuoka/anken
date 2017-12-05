class NotesController < ApplicationController
  before_action :authenticate_user!
  # before_action :correct_user, only: [:edit, :update]
  before_action :set_note, only: [:show, :edit, :update, :destroy ]
 

  # before_action :search, only: [:index, :export_csv]
  User = Struct.new(:name, :email)
  

    def index
    @q        = Note.ransack(params[:q])
    @number = @q.result(distinct: true).order(created_at: :desc)
    if params[:export_csv]
    @q        = Note.ransack(params[:q])
    @notes    = @q.result(distinct: true).order(created_at: :desc)
    send_data @notes.to_csv, filename: "案件CSV_#{Time.current.strftime('%Y%m%d')}.csv"
    end
   
    @q        = Note.ransack(params[:q])
    @notes    = @q.result(distinct: true).order(created_at: :desc).page(params[:page]).per(20)

    end

  def show
  end

 def create
    @note = current_user.notes.build(note_params)
   
      if @note.save
      	user = User.new("mail",@note)
        NoteMailer.delay.note_email(user, @note)
      redirect_to @note, notice: "案件が保存されました"
      else
        @notes = Note.all.order(created_at: :desc).page(params[:page]).per(6)
        render 'home/top'
      end 
   
 end

  def edit
  end

  def update
    if @note.update(note_params)
      NoteMailer.delay.note_email(current_user,@note)
      redirect_to @note, notice: "案件が更新されました"
    else
      render :edit
    end
  end

  def destroy
    @note.destroy
    redirect_to root_path
  end
  
  def import
  
  Note.import(params[:file])
  redirect_to root_path, notice: '案件をインポートしました'
  end
    # def import
    # @note = Note.find(params[:id])
    # Proposal.import(@note, proposal_params[:proposal])
    #     # Code.import(@software, proposal_params[:proposal])

    # redirect_to root_path, notice: 'Codes were successfully uploaded!'
    # end
    
  private
  
  

    def set_note
      @note = Note.find(params[:id])
    end
    
    
    def note_params
      params.require(:note).permit(:title, :sales_company,
      :end_user, :delivery_day, :content, :status, :miss,
      proposals_attributes: [:id, :model, :quantity, :price, :_destroy])
    end

    def correct_user
      note = Note.find(params[:id])
      if !current_user?(note.user)
        redirect_to root_path, alert: '許可されていないページです'
      end
    end
    
     
    
   
    
end