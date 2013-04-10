class CreateSubscriptionPlans < ActiveRecord::Migration
  def change
    create_table :subscription_plans do |t|
      t.decimal :price, :precision => 6, :scale => 2
      t.boolean :daily

      t.timestamps
    end
  end
end
