class Invitation < ApplicationRecord
  belongs_to :musician
  belongs_to :orchestra

  enum status: { pending: 0, accepted: 1, rejected: 2 }

end
