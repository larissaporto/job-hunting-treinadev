class Apply < ApplicationRecord
  belongs_to :job
  belongs_to :profile

  enum mark: {unstarred: 0, starred: 15}
end
