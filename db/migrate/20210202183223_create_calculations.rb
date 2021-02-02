class CreateCalculations < ActiveRecord::Migration[5.2]
  def change
    create_table :calculations do |t|
      t.integer :loan_amount
      t.integer :terms
      t.integer :interest_rate
      t.datetime :start_date

      t.timestamps
    end
  end
end
