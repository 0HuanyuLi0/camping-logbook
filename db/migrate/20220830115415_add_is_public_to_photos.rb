class AddIsPublicToPhotos < ActiveRecord::Migration[5.2]
  def change
    add_column :photos, :isPublic, :boolean
  end
end
