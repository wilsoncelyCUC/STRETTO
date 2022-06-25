class Orchestra < ApplicationRecord
  validates :name, length: { maximum: 16,
    too_long: "%{count} characters is the maximum allowed" }

  has_many :posts
  has_many :invitations, dependent: :destroy


  belongs_to :user
  STYLE = ["Classic","Pop","Electronic", "Jazz", ]
  TYPE_ORCHESTRA = ["Open", "Symphonic", "Concerto", "Opera"]
  MATCH = ["Yes", "No"]


 #PG search

 include PgSearch::Model
  pg_search_scope :search_with_bar,
    against: [ :type_orchestra, :size, :style, :zip_code],
    using: {
      tsearch: { prefix: true } # <-- search bar!
    }

  # Cloudinary
  has_one_attached :photo

end
