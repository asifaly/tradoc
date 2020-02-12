class CreateIncoterms < ActiveRecord::Migration[6.0]
  def change
    create_table :incoterms do |t|
      t.string :code
      t.string :description

      t.timestamps
    end
  end
end
