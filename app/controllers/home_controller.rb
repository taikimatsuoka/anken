class HomeController < ApplicationController
  def top
    if user_signed_in?
      @note = Note.new
      @note.proposals.build
      @notes = Note.all.order(created_at: :desc).page(params[:page]).per(6)
      # .includes(:proposals)
    else
      @message = "Imager案件DB"
    end
  end
  
  def about
  end
  
end


