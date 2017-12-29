class Post < ApplicationRecord
  belongs_to :topic
  has_many :comments, dependent: :destroy

  validates :title, length: { minimum: 5 }, presence: true
  validates :body, length: { minimum: 15 }, presence: true
  validates :topic, presence: true

end
