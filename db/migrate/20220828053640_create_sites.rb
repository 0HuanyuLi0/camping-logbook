class CreateSites < ActiveRecord::Migration[5.2]
  def change
    create_table :sites do |t|
      t.text :name
      t.text :location
      t.text :coordinates
      t.decimal :price
      t.text :link
      t.boolean :powered
      t.boolean :pets
      t.text :description

      t.timestamps
    end
  end
end
