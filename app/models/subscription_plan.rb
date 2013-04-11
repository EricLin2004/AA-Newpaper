class SubscriptionPlan < ActiveRecord::Base
  attr_accessible :daily, :price, :newspaper_id

  #validates :daily, :inclusion => { :in => ["1","0"] }
  validates :price, :presence => :true

  belongs_to :newspaper, :inverse_of => :subscription_plans

  has_many :subscriptions
  has_many :users, :through => :subscriptions
end
