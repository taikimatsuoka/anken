require 'csv'
require 'nkf'


csv_data = CSV.generate("", {:row_sep => "\r\n", :force_quotes => true}) do |csv|
  csv_column_names = %w(ID 担当 市場 販社 EU 機種 台数 価格 納期 状態)
  csv << csv_column_names
  @notes.each do |note|
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
