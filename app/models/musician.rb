class Musician < ApplicationRecord
  has_many :invitations, dependent: :destroy
  #validates :first_name, length: { maximum: 8,
   # too_long: "%{count} characters is the maximum allowed" }
  #validates :last_name, length: { maximum: 8,
   # too_long: "%{count} characters is the maximum allowed" }
  belongs_to :user

  STYLE = ["Classic", "Pop", "Electronic", "Jazz"]
  LEVEL = ["Beginner", "Intermediate", "Advanced"]
  INSTRUMENT = ["Accordion", "Bagpipe", "Banjo", "Bass drum", "Bass guitar", "Bell", "Bongo drum", "Bugle", "Castanets", "Cello", "Clarinet", "Concertina", "Conga", "Cornet", "Cymbal", "Double bass", "Drums", "Electric guitar", "Flute", "French horn", "Glockenspiel", "Gong", "Grand piano", "Guitar", "Harmonica", "Harp", "Keyboard", "Mandolin", "Maracas", "Marimba", "Microphone", "Oboe", "Organ", "Pan flute", "Piano", "Recorder", "Saxophone", "Sitar", "Snare drum", "Tambourine", "Timpani", "Triangle", "Trombone", "Trumpet", "Tuba", "Ukulele", "Vibraphone", "Violin", "Xylophone", "Zither"]


  #PG search

  include PgSearch::Model
    pg_search_scope :search_with_bar,
    against: [ :instrument, :level, :style, :zip_code],
    using: {
      tsearch: { prefix: true } # <-- search bar!
    }

  # Cloudinary
  has_one_attached :photo

end
