class Comment < ApplicationRecord
  # user/dreamのアソシエーション
  belongs_to :user
  belongs_to :dream

  # コメント内容をバリデーションチェック
  validates :comment, presence: true
end
