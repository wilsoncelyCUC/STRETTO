class Orchestra < ApplicationRecord
#  has_many :posts
#  has_many :invitations
#  has_many Musicians through invitation
  belongs_to :user
  STYLE = ["Classic","Pop","Electronic", "Jazz", ]
  TYPE_ORCHESTRA = ["Open", "Symphonic", "Concerto", "Opera"]
end
