class AddColumnToProposal < ActiveRecord::Migration
  def change
    add_column :proposals, :note_id, :integer
  end
end
