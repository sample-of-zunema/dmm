class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :timeoutable
  
  attachment :image
  
  has_many :dreams, dependent: :destroy
  has_many :comments, dependent: :destroy
  
end
