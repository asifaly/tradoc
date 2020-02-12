class Document < ApplicationRecord
  belongs_to :letter_of_credit
  belongs_to :incoterm
  belongs_to :user
  belongs_to :team
  belongs_to :currency
  has_rich_text :goods_description
end
