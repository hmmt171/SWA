class AddContentsIdToRecommendeds < ActiveRecord::Migration
  def change
    add_column :recommendeds, :contents_id, :integer
  end
end
