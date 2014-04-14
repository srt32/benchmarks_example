require 'spec_helper'

describe Campaign, 'Associations' do
  it { expect(subject).to have_many(:loans) }
end

describe Campaign, '#funds_raised' do
  it 'sums up the loans' do
    campaign = create(:campaign)
    create_list(:loan, 5)
    create_list(:loan, 5, campaign: campaign)

    expect(campaign.funds_raised).to eq 50
  end
end
