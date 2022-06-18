class Orchestra < ApplicationRecord
   has_many :posts
#  has_many :invitations
#  has_many Musicians through invitation
  belongs_to :user
  STYLE = ["Classic","Pop","Electronic", "Jazz", ]
  TYPE_ORCHESTRA = ["Open", "Symphonic", "Concerto", "Opera"]
  MATCH = ["yes", "no"]


 #PG search

 include PgSearch::Model
  pg_search_scope :search_with_bar,
    against: [ :type_orchestra, :size, :style, :zip_code],
#    associated_against: {
#      post: [ :instrument ]
#    },
    using: {
      tsearch: { prefix: true } # <-- search bar!
    }



end
