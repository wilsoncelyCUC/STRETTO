class MusiciansController < ApplicationController
  def index
    @musicians = Musician.all
    @orchestra = Orchestra.find_by(user: current_user)

    if params[:search]
      @filter =  "#{params[:search][:instrument]} #{ params[:search][:style]} #{params[:search][:level]} #{params[:search][:zip_code]}"
      @musicians = Musician.search_with_bar(@filter)
    end


#    respond_to do |format|
#      format.html
#      format.js
#    end
  end



  def show
    @musician = Musician.find(params[:id])


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
    @musician = Musician.find(params[:id])
  end

  def update
    @musician.update(musicians_params)
    redirect_to musician_path(@musician)
  end

  def destroy
    @musician = Musician.find(params[:id])
    @musician.destroy
    redirect_to musicians_path
  end



  private

  def musician_params
    params.require(:musician).permit(:first_name, :last_name, :birthday, :level, :instrument, :style, :zip_code, :user, :photo, :bio)
  end

end
