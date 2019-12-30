class Apply < ApplicationRecord
  belongs_to :job
  belongs_to :profile
  has_one :feedback
  has_one :proposal
  validates :cover_letter, presence: true, on: :update

  enum mark: {unstarred: 0, starred: 15}
  enum applicant_status: {eligible: 0, accepted: 10, rejected: 15}

  def one_apply_per_applicant
    total = Apply.where(job: job, profile: profile).count
    if total == 1
      errors.add('A validação falhou: Profile não pode se inscrever mais de uma vez')
    end
  end
end
