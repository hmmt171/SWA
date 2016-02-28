class RemoveImageUrlsFileNameFromContent < ActiveRecord::Migration
  def change
    remove_column :contents, :image_urls_file_name, :string
  end
end
