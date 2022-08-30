class CreateStories < ActiveRecord::Migration[5.2]
  def change
    create_table :stories do |t|
      t.text :title
      t.text :content
      t.integer :list_id
      t.integer :user_id
      t.integer :site_id

      t.timestamps
    end
  end
end
