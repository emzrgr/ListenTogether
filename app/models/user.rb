class User < ApplicationRecord
  has_many :moods, through: :user_moods

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end
