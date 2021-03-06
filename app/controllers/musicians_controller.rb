class MusiciansController < ApplicationController
  before_action :find_musician, only: [:show,  :edit, :update, :destroy]
  before_action :find_musician_nav
  before_action :find_orchestra_nav

  def index
    @musicians = Musician.all
    # search bar
    #byebug
    if params[:search]
      if !params[:search][:post].empty?
        post = Post.find(params[:search][:post])
        @filter =  "#{post.instrument} #{ post.style} #{post.level}"
        @musicians = Musician.search_with_bar(@filter)
      else
        @filter =  "#{params[:search][:instrument]} #{ params[:search][:style]} #{params[:search][:level]} #{params[:search][:zip_code]}"
        @musicians = Musician.search_with_bar(@filter)
      end
    end
  end

  def show
    @musician = Musician.find(params[:id])
    @invitation = Invitation.new
    @orchestra = Orchestra.find_by(user_id: current_user.id)
    if @musician && @orchestra
      @invitation_check = Invitation.find_by(orchestra_id: @orchestra.id , musician_id: @musician.id, status: 2)
      @email_musician = User.find(@musician.user_id).email
    end

  end

  def new
    if @musician = Musician.find_by(user_id: current_user.id)
      redirect_to orchestras_path
    else
      @musician = Musician.new
    end
  end

  def create
    @musician = Musician.new(musician_params)
    @musician.user = current_user
    if @musician.save!
    # Will raise ActiveModel::ForbiddenAttributesError
    redirect_to orchestras_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @musician.update(musician_params)
      redirect_to musician_path(@musician)
    else
      render :new
    end
  end

  def destroy
    @musician.destroy
    redirect_to musicians_path
  end



  private

  def find_musician
    @musician = Musician.find(params[:id])
  end

  def musician_params
    params.require(:musician).permit(:first_name, :last_name, :birthday, :level, :photo, :url_photo, :instrument, :phone_number ,:style, :zip_code, :user, :photo, :bio)
  end

  def find_musician_nav
    @musician_nav = Musician.find_by(user_id: current_user.id)
  end

  def find_orchestra_nav
    @orchestra_nav = Orchestra.find_by(user_id: current_user.id)
  end

end
