require 'csv'
require 'nkf'
# require 'cocoon'
# require 'kconv'
class Note < ActiveRecord::Base
  belongs_to :user
  
  has_many :proposals, dependent: :destroy
  accepts_nested_attributes_for :proposals, reject_if: :all_blank, allow_destroy: true
  

  
  validates :title, presence: true
  validates :content, presence: true
  validates :user_id, presence: true
  validates :sales_company, presence: true
  validates :end_user, presence: true
  validates :delivery_day, presence: true
  validates :status, presence: true
  # validates :proposals, presence: true


  def self.to_csv
  csv_data = CSV.generate("", {:row_sep => "\r\n", :force_quotes => true}) do |csv|
  csv_column_names = %w(ID 担当 市場 販社 EU 機種 台数 価格 納期 状態)
  csv << csv_column_names
  all.each do |note|
    note.proposals.each do |proposal|
    csv_column_values = [
      note.id,
      note.user.name,
      note.title,
      note.sales_company,
      note.end_user,
      proposal.model,
      proposal.quantity,
      proposal.price,
      note.delivery_day,
      note.status
      ]
    csv << csv_column_values
    end
  end
  end
  NKF::nkf('--sjis -Lw', csv_data)
  end


  def self.import(file)
  csv_text = File.read('db/file.csv')
  csv = CSV.parse(csv_text, :headers => true ,header_converters: :symbol)
  csv.each do |row|
    # Note.create!(row.to_hash)
    # title,sales_company,end_user,user_id,delivery_day,content,status,model,quantity,price
  
    Note.create!(:title => row[0],
                    :sales_company => row[1],
                    :end_user => row[2],
                    :user_id => row[4],
                    :delivery_day => row[3],
                    :content => row[5],
                    :status => row[6])
    Proposal.create!(:model => row[7],
                     :quantity => row[8],
                     :price => row[9],
                     :note_id => row[10])
  end
  end




end



