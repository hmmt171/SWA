class AddUrlToContents < ActiveRecord::Migration
  def change
    add_column :contents, :image_urls, :string
  end
end
