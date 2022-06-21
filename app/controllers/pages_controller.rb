class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]
  before_action :find_musician_nav
  before_action :find_orchestra_nav

  def home
    if current_user
    @musician = Musician.find_by(user_id: current_user.id)
    @orchestra = Orchestra.find_by(user_id: current_user.id)
    else
    end
  end

  #nav bar
  def find_musician_nav
    if current_user
      @musician_nav = Musician.find_by(user_id: current_user.id)
    end
  end

  def find_orchestra_nav
    if current_user
    @orchestra_nav = Orchestra.find_by(user_id: current_user.id)
    end
  end


end
