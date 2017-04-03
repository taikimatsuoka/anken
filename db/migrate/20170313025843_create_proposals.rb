class CreateProposals < ActiveRecord::Migration
  def change
    create_table :proposals do |t|
      t.string :model
      t.integer :quantity
      t.integer :price

      t.timestamps null: false
    end
  end
end
