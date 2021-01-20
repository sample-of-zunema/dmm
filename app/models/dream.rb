class Dream < ApplicationRecord

  # user/comments/favoritesをそれぞれアソシエーション
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  # いいねをしているかチェック
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  # 投稿時にtitle/body/start_timeが空でないかバリデーションチェック
  validates :title, presence: true
  validates :body, presence: true
  validates :start_time, presence: true

  # emotion（感情）の分類
  enum emotion: {楽しい: 0, 嫌気: 1, 悲しい: 2, 恐い: 3, 怒り: 4}

end
