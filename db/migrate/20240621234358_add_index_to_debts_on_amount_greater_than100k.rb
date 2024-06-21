class AddIndexToDebtsOnAmountGreaterThan100k < ActiveRecord::Migration[7.1]
  def change
    add_index :debts, :amount, name: 'index_debts_on_amount_greater_than_100k', where: "amount > 100000"
  end
end
