require 'rails_helper'

RSpec.describe "calculations/new", type: :view do
  before(:each) do
    assign(:calculation, Calculation.new(
      loan_amount: 1,
      terms: 1,
      interest_rate: 1
    ))
  end

  it "renders new calculation form" do
    render

    assert_select "form[action=?][method=?]", calculations_path, "post" do

      assert_select "input[name=?]", "calculation[loan_amount]"

      assert_select "input[name=?]", "calculation[terms]"

      assert_select "input[name=?]", "calculation[interest_rate]"
    end
  end
end
