class AddCurrencyToLetterOfCredits < ActiveRecord::Migration[6.0]
  disable_ddl_transaction!
  def change
    add_reference :letter_of_credits, :currency, null: false, foreign_key: true, index: {algorithm: :concurrently}
  end
end
