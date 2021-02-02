require 'rails_helper'

RSpec.describe "calculations/index", type: :view do
  before(:each) do
    assign(:calculations, [
      Calculation.create!(
        loan_amount: 2,
        terms: 3,
        interest_rate: 4
      ),
      Calculation.create!(
        loan_amount: 2,
        terms: 3,
        interest_rate: 4
      )
    ])
  end

  it "renders a list of calculations" do
    render
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: 3.to_s, count: 2
    assert_select "tr>td", text: 4.to_s, count: 2
  end
end
