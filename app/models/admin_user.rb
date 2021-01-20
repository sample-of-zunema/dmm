class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  # ActiveAdminの設定
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable

end
