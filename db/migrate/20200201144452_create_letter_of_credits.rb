class CreateLetterOfCredits < ActiveRecord::Migration[6.0]
  def change
    create_table :letter_of_credits do |t|
      t.string :lc_number
      t.date :expiry_date
      t.string :client
      t.string :comment
      t.references :user, null: false, foreign_key: true
      t.references :team, null: false, foreign_key: true

      t.timestamps
    end
  end
end
