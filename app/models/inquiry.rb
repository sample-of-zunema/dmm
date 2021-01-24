class Inquiry < ApplicationRecord

  # 問い合わせ内容のバリデーションチェック
  validates :name, presence: { message: '名前を入力してください' }
  validates :email, presence: { message: 'メールアドレスを入力してください' }
  validates :message, presence: { message: 'お問合せ内容を入力してください' }

end
