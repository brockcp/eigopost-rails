class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  validates :body, length: {minimum: 10}, presence: true
  validates :user, presence: true

end
