class Document < ApplicationRecord
  belongs_to :letter_of_credit
  attr_accessor :new_lc_number
  belongs_to :incoterm
  belongs_to :user
  belongs_to :team
  belongs_to :currency
  has_rich_text :goods_description
  before_save :create_lc

  def create_lc
    create_letter_of_credit(lc_number: new_lc_number) unless new_lc_number.blank?
  end
end
