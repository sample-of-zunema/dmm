class Dream < ApplicationRecord

  belongs_to :user
  has_many :comments, dependent: :destroy

  enum emotion: {楽しい: 0, 嫌気: 1, 悲しい: 2, 恐い: 3, 怒り: 4}

end
