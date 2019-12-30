class Feedback < ApplicationRecord
  belongs_to :apply

  validates :body, presence: true
end
