class ReplaceTransactionCreditNumberWithBigint < ActiveRecord::Migration[5.1]
  def change
    remove_column :transactions, :credit_card_number
    add_column :transactions, :credit_card_number, :bigint
  end
end
