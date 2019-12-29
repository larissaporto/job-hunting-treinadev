class Apply < ApplicationRecord
  belongs_to :job
  belongs_to :profile
  has_one :feedback
  has_one :proposal

  enum mark: {unstarred: 0, starred: 15}
  enum applicant_status: {eligible: 0, accepted: 10, rejected: 15}
end
