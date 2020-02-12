class AddCurrencyToDocuments < ActiveRecord::Migration[6.0]
  disable_ddl_transaction!
  def change
    add_reference :documents, :currency, null: false, foreign_key: true, index: {algorithm: :concurrently}
  end
end
