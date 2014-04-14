require 'spec_helper'

describe Loan, 'Associations' do
  it { expect(subject).to belong_to(:campaign) }
end
