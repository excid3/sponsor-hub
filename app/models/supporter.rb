class Supporter < ApplicationRecord
  has_many :sponsorships, dependent: :destroy
  has_many :creators, through: :sponsorships
  belongs_to :github_account
end
