class Topic < ApplicationRecord
  has_many :posts, dependent: :destroy#deleted when topic deleted
end
