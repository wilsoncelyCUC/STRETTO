require "application_system_test_case"

class ProductsTest < ApplicationSystemTestCase

   ############ VISITOR JOURNEY ##########################################
  test "visiting the index" do
    # Setup phase : empty for this case

    # Exercise phase / Verify phase
    visit root_url # "/"

    #save_and_open_screenshot #to see the data what the robot is using in a webpage
    assert_selector "a", text: "Create a Musician Profile"
    assert_selector "a", text: "Create an Orchestra Profile"
  end

  ############ MUSICIAN JOURNEY ##########################################
  test "A signed-in user can create a musician" do
    # Setup phase
    login_as users(:user_musician_robot)

    #Exercise phase
    visit '/musicians/new'
    fill_in "musician_first_name", with: "Wilson E."
    fill_in "musician_last_name", with: "Cely T."
=begin    fill_in "musician_birthday", with: "1985-10-22"
    fill_in "musician_level", with: "Beginner"
    fill_in "musician_instrument", with: "Accordion"
    fill_in "musician_style", with: "Classic"
    fill_in "musician_zip_code", with: 75014
=end
    #save_and_open_screenshot

    click_on "Create Musician"

    #Verify phase
    assert_equal orchestras_path, page.current_path, "User expected to go index orchestras after filling out the form"
    #User expected to go to index Orchestras, thus, checks if true
  end

  test "check profile" do
    login_as users(:user_musician_robot)
   # find(:xpath, "//a/img[alt='Profile Picture']/..").click
    select('.avatar')

  end


  test "Check a search using snack-bar" do
    login_as users(:user_musician_robot)
    fill_in 'search[size]', with: 5
    click_on "Save Search"

  end


end
