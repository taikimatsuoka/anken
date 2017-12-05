class AddOperatorToNote < ActiveRecord::Migration
  def change
    add_column :notes, :updated_by, :integer
  end
end
