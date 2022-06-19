class Orchestra < ApplicationRecord
  has_many :posts
  #  has_many :invitations
  #  has_many Musicians through invitation
  belongs_to :user
  STYLE = ["Classic", "Pop", "Rock", "Electronic", "Jazz", "Traditionnal"]
  TYPE_ORCHESTRA = ["Open", "Symphonic", "Harmonic", "Choir", "Opera", "Band", "Tipica", "Chamber", "Fanfare", "Brass Band", "Bagad", "Pipe Band", "Philarmonic", "Big Band", "Jazz Band", "Brass Band"]
  MATCH = ["Yes", "No"]


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
