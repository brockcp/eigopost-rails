class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :comment
  after_save :update_comment

  validates :value, inclusion: { in: [-1,1], message: "%{value} is not a valid vote." }, presence: true

  def update_comment
    comment.update_rank
  end

end
