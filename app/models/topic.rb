class Topic < ApplicationRecord
  has_many :posts, dependent: :destroy#deleted when topic deleted

  validates :name, length: { minimum: 5 }, presence: true
  validates :description, length: { minimum: 15 }, presence: true

end
