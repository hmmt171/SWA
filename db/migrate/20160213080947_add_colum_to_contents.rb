class AddColumToContents < ActiveRecord::Migration
  def change
    add_column :contents, :is_recommened, :boolean, default: false
  end
end
