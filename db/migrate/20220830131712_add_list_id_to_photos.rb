class AddListIdToPhotos < ActiveRecord::Migration[5.2]
  def change
    add_column :photos, :list_id, :integer
  end
end
