class RemoveImageUrlsUpdatedAtFromContent < ActiveRecord::Migration
  def change
    remove_column :contents, :image_urls_updated_at, :datetime
  end
end
