class Favorite < ApplicationRecord

  # user/dreamのアソシエーション
  belongs_to :user
  belongs_to :dream

end
