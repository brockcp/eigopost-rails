class Post < ApplicationRecord

  belongs_to :user
  has_many :comments, dependent: :destroy

  default_scope { order(created_at: :asc) } #desc

  validates :post_title, length: { minimum: 5 }, presence: true
  validates :post_body, length: { minimum: 15 }, presence: true
  validates :user, presence: true

end
