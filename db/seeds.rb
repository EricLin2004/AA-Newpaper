# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ActiveRecord::Base.transaction do 
	Newspaper.create!(title: "Vancouver Sun", editor: "Eric")
	Newspaper.create!(title: "Sydney Review", editor: "Peter")
	Newspaper.create!(title: "New Zealand Press", editor: "Aaron")
	Newspaper.create!(title: "New York Times", editor: "Darwish")

	User.create!(name: "Eric", password: "cookie")

	SubscriptionPlan.create!(daily: true, price: 12.99, newspaper_id: 1)
	SubscriptionPlan.create!(daily: false, price: 13.99, newspaper_id: 2)
	SubscriptionPlan.create!(daily: true, price: 24.99, newspaper_id: 1)
	SubscriptionPlan.create!(daily: false, price: 25.99, newspaper_id: 2)
	SubscriptionPlan.create!(daily: true, price: 15.99, newspaper_id: 3)
	SubscriptionPlan.create!(daily: false, price: 16.99, newspaper_id: 4)
end