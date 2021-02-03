class Calculation < ApplicationRecord
  validates :loan_amount, :terms, :interest_rate, :start_date, presence: true
end
