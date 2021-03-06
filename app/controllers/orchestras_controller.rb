class OrchestrasController < ApplicationController
before_action :find_orchestra, only: [:show,  :edit, :update, :destroy]
before_action :find_orchestra_nav
before_action :find_musician_nav

  def index
    @orchestras = Orchestra.all

    #search bar
    if params[:search]
      @match = params[:search][:match]
      @filter = "#{params[:search][:type_orchestra]} #{ params[:search][:style]} #{params[:search][:zip_code]} #{params[:search][:size]} "
      # Feature match-my-need
      if @match == "Yes"
        @musician = Musician.find_by(user: current_user)
        instrument = @musician.instrument
        orchestras_base = Orchestra.joins(:posts).where(posts: {instrument: instrument  })

        if @filter.blank?
          @orchestras = orchestras_base
        else
          @orchestras = orchestras_base.search_with_bar(@filter)
        end

      else
        if @filter.blank?
          @orchestras = Orchestra.all
        else
          @orchestras = Orchestra.search_with_bar(@filter)
        end
      end
    end
  end

  def show
    @posts = @orchestra.posts
    @post = Post.new
    @invitation = Invitation.new
    @musician = Musician.find_by(user_id: current_user.id)

    if  @musician && @orchestra
      @invitation_check = Invitation.find_by(musician_id: @musician.id , orchestra_id: @orchestra.id, status: 2)
      @email_orchestra = User.find(@orchestra.user_id).email
    end
  end

  def new
    if @orchestra = Orchestra.find_by(user_id: current_user.id)
      redirect_to musicians_path
    else
      @orchestra = Orchestra.new
    end
  end

  def create
    @orchestra = Orchestra.new(orchestra_params)
    @orchestra.user = current_user
    if @orchestra.save!
      redirect_to musicians_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @orchestra.update(orchestra_params)
      redirect_to orchestra_path(@orchestra)
    else
      render :new
    end
  end

  def destroy
    @orchestra.destroy
    redirect_to root_path
  end

  private

  def find_orchestra
    @orchestra = Orchestra.find(params[:id])
  end

  def orchestra_params
    params.require(:orchestra).permit(:style, :type, :size, :zip_code, :photo, :frequency, :type_orchestra, :phone_number, :name, :description, :bio)
  end

  def find_orchestra_nav
    @orchestra_nav = Orchestra.find_by(user_id: current_user.id)
  end

  def find_musician_nav
    @musician_nav = Musician.find_by(user_id: current_user.id)
  end

end
