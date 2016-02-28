class AddHeadlineToContents < ActiveRecord::Migration
  def change
    add_column :contents, :text_headline, :text
  end
end
