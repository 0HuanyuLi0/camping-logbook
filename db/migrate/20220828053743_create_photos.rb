class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
      t.text :name
      t.date :date
      t.text :link

      t.timestamps
    end
  end
end
