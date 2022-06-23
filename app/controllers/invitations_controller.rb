class InvitationsController < ApplicationController
  def index
    #route musician to invitations
    if Musician.find_by(user_id: current_user.id)
      @musician = Musician.find_by(user_id: current_user.id)
      @invitations = Invitation.where(musician: @musician)
      @invitations_sent = @invitations.where(status: 0)
      @invitations_received = @invitations.where(status: 1)
      @invitations_accepted = @invitations.where(status: 2)

    #route other than musician to invitations (orchestra)
    else
      @orchestra =  Orchestra.find_by(user_id: current_user.id)
      @invitations = Invitation.where(orchestra: @orchestra)
      @invitations_sent = @invitations.where(status: 1)
      @invitations_received = @invitations.where(status: 0)
      @invitations_accepted = @invitations.where(status: 2)
      #comment

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
    if Orchestra.find_by(user_id: current_user.id)
      musician = Musician.find(params[:musician_id])
      @invitation.musician = musician
      orchestra = Orchestra.find_by(user_id: current_user.id)
      @invitation.orchestra = orchestra
      @invitation.pending_om!
    # Will raise ActiveModel::ForbiddenAttributesError
    else
      orchestra = Orchestra.find(params[:orchestra_id])
      @invitation.orchestra = orchestra
      musician = Musician.find_by(user_id: current_user.id)
      @invitation.musician = musician
      @invitation.pending_mo!
      # Will raise ActiveModel::ForbiddenAttributesError
    end
    @invitation.save
    redirect_to root_path
  end


  def update
    @status = params[:status]
    if Musician.find_by(user_id: current_user.id)
      @musician = Musician.find_by(user_id: current_user.id)
      @invitation = Invitation.find_by(musician: @musician)
      if @status == 'accepted'
        @invitation.accepted!
        redirect_to musician_invitations_path(@musician)
      else @status == 'rejected'
        @invitation.rejected!
        redirect_to musician_invitations_path(@musician)
      end
    #route other than musician to invitations (orchestra)
    else
      @orchestra =  Orchestra.find_by(user_id: current_user.id)
      @invitation = Invitation.find_by(orchestra: @orchestra)
      if @status == 'accepted'
        @invitation.accepted!
        redirect_to orchestra_invitations_path(@orchestra)
      else @status == 'rejected'
        @invitation.rejected!
        redirect_to orchestra_invitations_path(@orchestra)
      end
    end
  end
  private

  def invitation_params
    params.require(:invitation)
  end
end
