# == Schema Information
#
# Table name: teams
#
#  id                 :bigint(8)        not null, primary key
#  card_exp_month     :string
#  card_exp_year      :string
#  card_last4         :string
#  card_type          :string
#  extra_billing_info :text
#  name               :string
#  personal           :boolean          default(FALSE)
#  processor          :string
#  trial_ends_at      :datetime
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  owner_id           :bigint(8)
#  processor_id       :string
#
# Indexes
#
#  index_teams_on_owner_id  (owner_id)
#
# Foreign Keys
#
#  fk_rails_...  (owner_id => users.id)
#

class Team < ApplicationRecord
  include Pay::Billable

  belongs_to :owner, class_name: "User"
  has_many :team_invitations, dependent: :destroy
  has_many :team_members, dependent: :destroy
  has_many :users, through: :team_members
  has_many :documents, dependent: :destroy
  has_many :letter_of_credits, dependent: :destroy

  scope :personal, ->{ where(personal: true) }
  scope :impersonal, ->{ where(personal: false) }

  has_one_attached :avatar

  validates :name, presence: true

  def email
    team_members.includes(:user).order(created_at: :asc).first.user.email
  end

  def personal_team_for?(user)
    personal? && owner_id == user.id
  end
end
