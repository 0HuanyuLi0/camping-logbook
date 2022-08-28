class AddSiteIdToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :site_id, :integer
  end
end
