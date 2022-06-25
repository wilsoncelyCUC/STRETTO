class Post < ApplicationRecord
  belongs_to :orchestra
  POST_TYPE = ["One time", "Recurrent"]
  LEVEL = ["Beginner", "Intermediate", "Advanced"]
  INSTRUMENT = ["Accordion", "Bagpipe", "Banjo", "Bass drum", "Bass guitar", "Bell", "Bongo drum", "Bugle", "Castanets", "Cello", "Clarinet", "Concertina", "Conga", "Cornet", "Cymbal", "Double bass", "Drums", "Electric guitar", "Flute", "French horn", "Glockenspiel", "Gong", "Grand piano", "Guitar", "Harmonica", "Harp", "Keyboard", "Mandolin", "Maracas", "Marimba", "Microphone", "Oboe", "Organ", "Pan flute", "Piano", "Recorder", "Saxophone", "Sitar", "Snare drum", "Tambourine", "Timpani", "Triangle", "Trombone", "Trumpet", "Tuba", "Ukulele", "Vibraphone", "Violin", "Xylophone", "Zither"]

  def name
    tag_post
  end

end
