class Dream < ApplicationRecord

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
  
  validates :title, presence: true
  validates :body, presence: true
  validates :start_time, presence: true

  enum emotion: {楽しい: 0, 嫌気: 1, 悲しい: 2, 恐い: 3, 怒り: 4}

end
