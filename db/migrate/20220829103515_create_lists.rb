class CreateLists < ActiveRecord::Migration[5.2]
  def change
    create_table :lists do |t|
      t.text :title
      t.integer :user_id
      t.text :note

      t.timestamps
    end
  end
end
