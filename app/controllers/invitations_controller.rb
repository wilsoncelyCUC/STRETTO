class InvitationsController < ApplicationController
  before_action :find_musician_nav
  before_action :find_orchestra_nav


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
      orchestra =  params[:orchestraparams]
      @orchestra = Orchestra.find(orchestra)
      @musician = Musician.find_by(user_id: current_user.id)
      @invitation = Invitation.where(musician_id: @musician.id, orchestra_id: @orchestra.id)
      if @status == 'accepted'
        @invitation.first.accepted!
        redirect_to musician_invitations_path(@musician)
      else @status == 'rejected'
        @invitation.first.rejected!
        redirect_to musician_invitations_path(@musician)
      end
    #route other than musician to invitations (orchestra)
    else
      musician =  params[:musicianparams]
      @musician = Musician.find(musician)
      @orchestra =  Orchestra.find_by(user_id: current_user.id)
      @invitation = Invitation.where(musician_id: @musician.id, orchestra_id: @orchestra.id)
      if @status == 'accepted'
        @invitation.first.accepted!
        redirect_to orchestra_invitations_path(@orchestra)
      else @status == 'rejected'
        @invitation.first.rejected!
        redirect_to orchestra_invitations_path(@orchestra)
      end
    end
  end
  private

  def invitation_params
    params.require(:invitation)
  end

  def find_musician_nav
    @musician_nav = Musician.find_by(user_id: current_user.id)
  end

  def find_orchestra_nav
    @orchestra_nav = Orchestra.find_by(user_id: current_user.id)
  end
end
