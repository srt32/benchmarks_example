class Campaign < ActiveRecord::Base
  has_many :loans

  def funds_raised
    loans.sum(:amount)
  end
end
