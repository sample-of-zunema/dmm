class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  # deviseの基本設定（:authentication_keys => [:name]を追加し、nameでログインできる設定）
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :timeoutable, authentication_keys: [:name]

  # 新規登録時nameも必須にするためバリデーションチェック
  validates :name, presence: true

  # ゲストがパスワードを変更できない設定
  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
    end
  end

  # carrierwaveでの画像アップロード設定
  mount_uploader :image, ImageUploader

  # dreams/comments/favoritesをそれぞれアソシエーション
  has_many :dreams, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
end
