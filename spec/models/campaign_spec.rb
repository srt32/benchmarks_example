require 'spec_helper'

describe Campaign, 'Associations' do
  it { expect(subject).to have_many(:loans) }
end

describe Campaign, '#funds_raised' do
  it '_sql' do
    campaign = create(:campaign)
    create_list(:loan, 5)
    create_list(:loan, 5, campaign: campaign)

    expect(campaign.funds_raised_sql).to eq 50
  end

  it '_ruby' do
    campaign = create(:campaign)
    create_list(:loan, 5)
    create_list(:loan, 5, campaign: campaign)

    expect(campaign.funds_raised_ruby).to eq 50
  end
end
