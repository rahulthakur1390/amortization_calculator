require 'rails_helper'

RSpec.describe "calculations/show", type: :view do
  before(:each) do
    @calculation = assign(:calculation, Calculation.create!(
      loan_amount: 2,
      terms: 3,
      interest_rate: 4
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
  end
end
