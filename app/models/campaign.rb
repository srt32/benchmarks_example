class Campaign < ActiveRecord::Base
  has_many :loans

  def funds_raised_sql
    loans.sum(:amount)
  end

  def funds_raised_ruby
    loans.map(&:amount).inject(:+)
  end
end
