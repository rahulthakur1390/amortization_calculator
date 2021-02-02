require 'rails_helper'

RSpec.describe "calculations/edit", type: :view do
  before(:each) do
    @calculation = assign(:calculation, Calculation.create!(
      loan_amount: 1,
      terms: 1,
      interest_rate: 1
    ))
  end

  it "renders the edit calculation form" do
    render

    assert_select "form[action=?][method=?]", calculation_path(@calculation), "post" do

      assert_select "input[name=?]", "calculation[loan_amount]"

      assert_select "input[name=?]", "calculation[terms]"

      assert_select "input[name=?]", "calculation[interest_rate]"
    end
  end
end
