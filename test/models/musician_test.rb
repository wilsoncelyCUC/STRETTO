require "test_helper"

class MusicianTest < ActiveSupport::TestCase
  test "full_name returns the capitalized first name and last name" do
    musician = Musician.new(
      first_name: "john",
      last_name: "lennon",
      birthday: '2010-09-25',
      level: "Beginner",
      instrument: "Accordion",
      style: "Classic",
      bio: "I am an automatic test and this user is fake",
      zip_code: 75014,
      user_id: 1,
      phone_number: "+33633264905"
    )
    assert_equal "John Lennon", musician.full_name
  end
end
