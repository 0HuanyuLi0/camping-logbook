class AddSiteIdToPhotos < ActiveRecord::Migration[5.2]
  def change
    add_column :photos, :site_id, :integer
  end
end
