class CreateDocuments < ActiveRecord::Migration[6.0]
  def change
    create_table :documents do |t|
      t.references :letter_of_credit, null: false, foreign_key: true
      t.date :issue_date
      t.date :shipment_date
      t.references :incoterm, null: false, foreign_key: true
      t.integer :exw_amount
      t.integer :fob_amount
      t.integer :freight_amount
      t.integer :total_amount
      t.string :place_of_receipt
      t.string :port_of_loading
      t.string :port_of_discharge
      t.string :final_destination
      t.string :issuing_bank
      t.references :user, null: false, foreign_key: true
      t.references :team, null: false, foreign_key: true

      t.timestamps
    end
  end
end
