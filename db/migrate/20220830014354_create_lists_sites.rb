class CreateListsSites < ActiveRecord::Migration[5.2]
  def change
    create_table :lists_sites do |t|
      t.integer :list_id
      t.integer :site_id
    end
  end
end
