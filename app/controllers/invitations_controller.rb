class InvitationsController < ApplicationController
  def index
    @invitations = Invitation.all
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
    @invitation = Invitation.new(invitation_params)
    if params[:musician_id]
      musician = Musician.find(params[:musician_id])
      @invitation.musician = musician
      orchestra = Orchestra.find(current_user.id)
      @invitation.orchestra = orchestra
    # Will raise ActiveModel::ForbiddenAttributesError
    else
      orchestra = Orchestra.find(params[:orchestra_id])
      @invitation.orchestra = orchestra
      musician = Musician.find(current_user.id)
      @invitation.musician = musician
      # Will raise ActiveModel::ForbiddenAttributesError
    end
    @invitation.save
    redirect_to root_path
  end

  private

  def invitation_params
    params.require(:invitation).permit(:status)
  end
end
