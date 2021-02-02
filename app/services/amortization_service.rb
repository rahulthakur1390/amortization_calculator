class AmortizationService
  # Make attributes accessible
  attr_accessor :loan_amount, :interest_rate, :terms

  def initialize(loan_amount, interest_rate, terms)
    @loan_amount   = loan_amount.to_f
    @interest_rate = interest_rate.to_f/100
    @terms         = terms
  end

  def payment(loan_amount, interest_rate, terms)
    (loan_amount * ( (interest_rate/terms/(1-((1+interest_rate/terms)**(terms * -1)))) )).round(2)
  end

  def amortization_table(val)
    terms        = Array.new(val.terms)
    payments     = Array.new(val.terms)
    loan_amounts = Array.new(val.terms)
    interests    = Array.new(val.terms)
    balances     = Array.new(val.terms)

    payments[0]     = 0
    loan_amounts[0] = 0
    interests[0]    = 0
    balances[0]     = val.loan_amount

    for i in(1..val.terms)
      if i != val.terms
        payments[i] = payment(val.loan_amount, val.interest_rate, val.terms)
      else
        payments[i] = payment(val.loan_amount, val.interest_rate, val.terms)
      end
      interests[i]    = ((balances[i-1]).to_f * (val.interest_rate/val.terms)).round(2)
      loan_amounts[i] = (payments[i] - interests[i]).round(2)
      if i == val.terms
        balances[i] = (balances[i-1] - payments[i] + interests[i]).round(0)
      else
        balances[i] = (balances[i-1] - payments[i] + interests[i]).round(2)
      end
    end

    records = []
    for i in(1..val.terms)
      records << {payments: payments[i], loan_amounts: loan_amounts[i], interests: interests[i], balances:balances[i]}
    end
    records
  end
end
