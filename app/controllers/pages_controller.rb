class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    if current_user
    @musician = Musician.find_by(user_id: current_user.id)
    @orchestra = Orchestra.find_by(user_id: current_user.id)
    else
    end
  end
end
