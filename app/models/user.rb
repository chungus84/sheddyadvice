class User < ApplicationRecord
  acts_as_votable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :messages, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_one_attached :photo

  has_many :sender_chatrooms, class_name: 'Chatroom', foreign_key: 'sender_id'
  has_many :receiver_chatrooms, class_name: 'Chatroom', foreign_key: 'receiver_id'
end
