class Creator < ApplicationRecord
  has_many :tiers, dependent: :destroy
  has_many :sponsorships, dependent: :destroy
  has_many :supporters, through: :sponsorships
  belongs_to :github_account
end
