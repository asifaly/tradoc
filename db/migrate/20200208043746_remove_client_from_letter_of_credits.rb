class RemoveClientFromLetterOfCredits < ActiveRecord::Migration[6.0]
  def change
    safety_assured {remove_column :letter_of_credits, :client, :string}
  end
end