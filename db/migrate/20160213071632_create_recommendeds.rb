class CreateRecommendeds < ActiveRecord::Migration
  def change
    create_table :recommendeds do |t|

      t.timestamps null: false
    end
  end
end
