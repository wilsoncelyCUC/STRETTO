class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  def after_sign_in_path_for(resource)
    if @musician = Musician.find_by(user_id: current_user.id)
      stored_location_for(resource) || orchestras_path
    elsif @orchestra = Orchestra.find_by(user_id: current_user.id)
      stored_location_for(resource) || musicians_path
    else
      stored_location_for(resource) || root_path
    end
  end
end
