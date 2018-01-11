class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :user

  default_scope { order(created_at: :asc) } #desc

  validates :name, length: { minimum: 5 }, presence: true
  validates :description, length: { minimum: 15 }, presence: true
  validates :user, presence: true

end
