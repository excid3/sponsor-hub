class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
         :validatable, :omniauthable, omniauth_providers: %i[github]

  has_one_attached :avatar
  has_person_name

  has_many :notifications, as: :recipient
   
  # TODO: verify there isn't a reason not to dependent: :destroy
  has_many :services, dependent: :destroy

end
