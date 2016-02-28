class RemoveImageUrlsFromContent < ActiveRecord::Migration
  def change
    remove_column :contents, :image_urls, :string
  end
end
