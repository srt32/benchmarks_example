FactoryGirl.define do
  factory :campaign do
    name 'campaign'
  end

  factory :loan do
    campaign
    amount 10
  end
end
