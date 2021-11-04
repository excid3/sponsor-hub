class GithubAccount < ApplicationRecord
  has_one :creator, dependent: :destroy
  has_one :supporter, dependent: :destroy
  belongs_to :user
end
