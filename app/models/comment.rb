class Comment < ApplicationRecord

  belongs_to :user
  belongs_to :dream
  
  validates :comment, presence: true

end
