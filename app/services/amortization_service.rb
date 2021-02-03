class AmortizationService
  # Make attributes accessible
  attr_accessor :loan_amount, :interest_rate, :terms, :start_date

  def initialize(loan_amount, interest_rate, terms, start_date)
    @loan_amount   = loan_amount.to_f
    @interest_rate = interest_rate.to_f / 100
    @terms         = terms
    @start_date    = start_date
  end

  def amortization_table
    start_balance = loan_amount
    records = []
    date = start_date
    for i in(1..terms)
      total_payment =  payment( loan_amount, interest_rate, terms )
      interest = (start_balance.to_f * ( interest_rate / terms )).round(2)
      principle = ( total_payment - interest ).round(2)
      end_balance = ( start_balance - total_payment + interest ).round(2)

      records << {
        date: date.strftime("%m/%d/%Y"),
        start_balance: start_balance,
        principle: principle,
        interest: interest,
        total_payment: total_payment,
        end_balance: end_balance.negative? ? 0 : end_balance
      }
      start_balance = end_balance
      date = @start_date + i.month
    end
    records
  end

  private

  def payment(loan_amount, interest_rate, terms)
    ( loan_amount * (( interest_rate / terms / ( 1 - (( 1 + interest_rate / terms ) ** ( terms * -1 )))))).round(2)
  end
end
