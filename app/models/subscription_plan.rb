class SubscriptionPlan < ActiveRecord::Base
  attr_accessible :daily, :price, :newspaper_id
  belongs_to :newspaper
end
