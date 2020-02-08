class AddAmountToLetterOfCredits < ActiveRecord::Migration[6.0]
  def change
    add_column :letter_of_credits, :amount, :integer
  end
end
