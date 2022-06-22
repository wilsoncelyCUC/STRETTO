class InvitationsController < ApplicationController
  def index
    if @musician = Musician.find_by(user_id: current_user.id)
      @invitations = Invitation.where(musician_id: params[:orchestra_id])
    else
      @invitations = Invitation.where(orchestra_id: params[:orchestra_id])
    end
  end

  def show
    @invitation = Invitation.find(params[:id])
  end

  def new
    @invitation = Invitation.new
    if params[:musician_id]
      @musician = Musician.find(params[:musician_id])
    else
      @orchestra = Orchestra.find(params[:orchestra_id])
    end
  end

  def create
    @invitation = Invitation.new
    if params[:musician_id]
      musician = Musician.find(params[:musician_id])
      @invitation.musician = musician
      orchestra = Orchestra.find_by(user_id: current_user.id)
      @invitation.orchestra = orchestra
      @invitation.pending!
    # Will raise ActiveModel::ForbiddenAttributesError
    else
      orchestra = Orchestra.find(params[:orchestra_id])
      @invitation.orchestra = orchestra
      musician = Musician.find_by(user_id: current_user.id)
      @invitation.musician = musician
      @invitation.pending!
      # Will raise ActiveModel::ForbiddenAttributesError
    end
    @invitation.save
    redirect_to root_path
  end

  private

  def invitation_params
    params.require(:invitation)
  end
end
