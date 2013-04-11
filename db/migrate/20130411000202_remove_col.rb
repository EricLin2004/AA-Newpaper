class RemoveCol < ActiveRecord::Migration
  def change
  	remove_column :subscription_plans, :news_id
  end
end
