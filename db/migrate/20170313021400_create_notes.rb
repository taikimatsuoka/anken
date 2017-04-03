class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
          t.string :title
          t.text :content
          t.integer :user_id
          t.string :sales_company
          t.string :end_user
          t.date :delivery_day
          t.string :status
          t.text :miss
          t.timestamps null: false
    end
  end
end
