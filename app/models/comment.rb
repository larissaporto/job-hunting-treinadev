class Comment < ApplicationRecord
  belongs_to :profile

  validates :commenter, :body, presence: true
end
