class InvitationsController < ApplicationController
  def index
    @invitations = Invitation.all
  end

  def show
    @invitation = Invitation.find(params[:id])
  end

  def new
    @invitation = Invitation.new
  end
   # find a musician and a orchestra and add them to the create
  def create
    @invitation = Invitation.new(invitation_params)
    orchestra = Orchestra.find(params[:orchestra_id])
    @invitation.orchestra = orchestra
    musician = current_user.musician
    @invitation.musician = musician
    @invitation.save
    # Will raise ActiveModel::ForbiddenAttributesError
    redirect_to root_path
  end

  private

  def invitation_params
    params.require(:invitation).permit(:status)
  end
end
