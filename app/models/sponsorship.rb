class Sponsorship < ApplicationRecord
  belongs_to :tier
  belongs_to :supporter
  belongs_to :creator
end
