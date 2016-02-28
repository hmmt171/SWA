class AddEyecatchContentToContents < ActiveRecord::Migration
  def change
    add_column :contents, :eyecatch_content, :boolean, default: false
  end
end
