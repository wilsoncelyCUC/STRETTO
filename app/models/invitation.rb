class Invitation < ApplicationRecord
  belongs_to :musician
  belongs_to :orchestra
end
