class AddAttachmentImageUrlsToContents < ActiveRecord::Migration
  def self.up
    change_table :contents do |t|
      t.attachment :image_urls
    end
  end

  def self.down
    remove_attachment :contents, :image_urls
  end
end
