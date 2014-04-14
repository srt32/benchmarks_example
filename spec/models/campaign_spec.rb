require 'spec_helper'

describe Campaign, 'Associations' do
  it { expect(subject).to have_many(:loans) }
end
