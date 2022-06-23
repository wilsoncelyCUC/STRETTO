class Invitation < ApplicationRecord
  belongs_to :musician
  belongs_to :orchestra

  enum status: { pending_mo: 0, pending_om: 1, accepted: 2, rejected: 3 }

end
