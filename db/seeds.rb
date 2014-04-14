# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Campaign.destroy_all
Loan.destroy_all

campaigns = FactoryGirl.create_list(:campaign, 10)

campaigns.each do |campaign|
  FactoryGirl.create_list(:loan, 100, campaign: campaign)
end
