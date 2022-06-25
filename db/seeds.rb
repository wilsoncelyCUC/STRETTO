require "open-uri"
require 'json'
require 'faker'

puts "Cleaning database ..."
#Invitation.description
Post.destroy_all
Musician.destroy_all
Orchestra.destroy_all
User.destroy_all

#Creation test user
usertest = User.create!(
  email: 'chopin@stretto.com',
  password: 'password'
)
puts "TEST USER #{usertest.email} created (LOGIN with this one)"
#===================

#Creation of 50 Musicians
50.times do
user_musician = User.create!(
  email: Faker::Internet.email ,
  password: 'password'
)
  mymusician = Musician.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    birthday: Faker::Date.between(from: '1948-09-23', to: '2000-09-25'),
    level: ["Beginner", "Intermediate", "Advanced"].sample,
    instrument: ["Accordion", "Bagpipe", "Banjo", "Bass drum", "Bass guitar", "Bell", "Bongo drum", "Bugle", "Castanets", "Cello", "Clarinet", "Concertina", "Conga", "Cornet", "Cymbal", "Double bass", "Drums", "Electric guitar", "Flute", "French horn", "Glockenspiel", "Gong", "Grand piano", "Guitar", "Harmonica", "Harp", "Keyboard", "Mandolin", "Maracas", "Marimba", "Microphone", "Oboe", "Organ", "Pan flute", "Piano", "Recorder", "Saxophone", "Sitar", "Snare drum", "Tambourine", "Timpani", "Triangle", "Trombone", "Trumpet", "Tuba", "Ukulele", "Vibraphone", "Violin", "Xylophone", "Zither"].sample,
    style: ["Classic", "Pop", "Electronic", "Jazz"].sample,
    bio: Faker::Lorem.sentence(word_count: 6),
    zip_code: [75000, 75001, 75002, 75003, 75004, 75005, 75006, 75007, 75008, 75009, 75010, 75011, 75012, 75013, 75014, 75015, 75016, 75017, 75018, 75019, 75020].sample,
    user_id: user_musician.id,
    phone_number: Faker::PhoneNumber.phone_number_with_country_code
  )
  file = URI.open('https://www.thispersondoesnotexist.com/image')
  mymusician.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
  puts "the musician #{mymusician.first_name} #{mymusician.last_name} was created"
end

#=============================


#Creation of 30 Orchestras
30.times do

  user_orchestra = User.create!(
    email: Faker::Internet.email ,
    password: 'password'
  )
  my_orchestra = Orchestra.create!(
    style: ["Classic","Pop","Electronic", "Jazz"].sample,
    type_orchestra: ["Open", "Symphonic", "Concerto", "Opera"].sample,
    size: [5, 15, 10, 4, 20].sample,
    zip_code: [75000, 75001, 75002, 75003, 75004, 75005, 75006, 75007, 75008, 75009, 75010, 75011, 75012, 75013, 75014, 75015, 75016, 75017, 75018, 75019, 75020].sample,
    frequency: "Rehearsals every #{['Monday', "Tuesday", "Wednesday", "Thursday", "Sunday"].sample} at 7 PM",
    description: Faker::Lorem.sentence(word_count: 30),
    name: Faker::Music.band,
    bio: Faker::Lorem.sentence(word_count: 6),
    user_id: user_orchestra.id,
    phone_number: Faker::PhoneNumber.phone_number_with_country_code

  )
    file = URI.open('https://www.thispersondoesnotexist.com/image')
    my_orchestra.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
  puts "the orchestra #{my_orchestra.name} with #{my_orchestra.style} style; was created"

  #Creation of 5 Post Recurrent
  5.times do
    mypost = Post.create!(
      instrument: ["Accordion", "Bagpipe", "Banjo", "Bass drum", "Bass guitar", "Bell", "Bongo drum", "Bugle", "Castanets", "Cello", "Clarinet", "Concertina", "Conga", "Cornet", "Cymbal", "Double bass", "Drums", "Electric guitar", "Flute", "French horn", "Glockenspiel", "Gong", "Grand piano", "Guitar", "Harmonica", "Harp", "Keyboard", "Mandolin", "Maracas", "Marimba", "Microphone", "Oboe", "Organ", "Pan flute", "Piano", "Recorder", "Saxophone", "Sitar", "Snare drum", "Tambourine", "Timpani", "Triangle", "Trombone", "Trumpet", "Tuba", "Ukulele", "Vibraphone", "Violin", "Xylophone", "Zither"].sample,
      description: Faker::Lorem.sentence(word_count: 20),
      level: ["Beginner", "Intermediate", "Advanced"].sample,
      periodicity: my_orchestra.frequency,
      type_post: "Recurrent",
      style: my_orchestra.style,
      orchestra_id: my_orchestra.id
    )
  end
  #Creation of 5 Post one-shot
  5.times do
  mypost = Post.create!(
    instrument: ["Accordion", "Bagpipe", "Banjo", "Bass drum", "Bass guitar", "Bell", "Bongo drum", "Bugle", "Castanets", "Cello", "Clarinet", "Concertina", "Conga", "Cornet", "Cymbal", "Double bass", "Drums", "Electric guitar", "Flute", "French horn", "Glockenspiel", "Gong", "Grand piano", "Guitar", "Harmonica", "Harp", "Keyboard", "Mandolin", "Maracas", "Marimba", "Microphone", "Oboe", "Organ", "Pan flute", "Piano", "Recorder", "Saxophone", "Sitar", "Snare drum", "Tambourine", "Timpani", "Triangle", "Trombone", "Trumpet", "Tuba", "Ukulele", "Vibraphone", "Violin", "Xylophone", "Zither"].sample,
    description: Faker::Lorem.sentence(word_count: 15),
    level: ["Beginner", "Intermediate", "Advanced"].sample,
    date: Faker::Date.forward(days: 23),
    type_post: "One time",
    style: my_orchestra.style,
    orchestra_id: my_orchestra.id
    )
  end

  puts "#{Post.count} posts created"
end
