class AddBalanceToPerson < ActiveRecord::Migration[7.1]
  def change
    add_column :people, :balance, :float
  end
end
