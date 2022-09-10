class User < ApplicationRecord
  acts_as_votable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :messages, dependent: :destroy
  has_many :chatrooms, dependent: :destroy
  has_many :posts, dependent: :destroy
end
