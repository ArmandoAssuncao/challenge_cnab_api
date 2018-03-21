class CreateFinancialTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :financial_transactions do |t|
      t.integer :type_id, null: false
      t.datetime :datetime, null: false
      t.decimal :value, null: false
      t.string :cpf, null: false
      t.string :card_number, null: false

      t.timestamps
    end
  end
end
