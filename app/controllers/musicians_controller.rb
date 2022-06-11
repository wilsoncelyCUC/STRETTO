class MusiciansController < ApplicationController
  def index
    @musicians = Musician.all
  end

  def show
    @musician = Musician.find(params[:id])
  end

  def new
    @musician = Musician.new
  end

  def create
    @musician = Musician.new(musician_params)
    if @musician.save
    # Will raise ActiveModel::ForbiddenAttributesError
    redirect_to musician_path(@musician)
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

    # no need for app/views/restaurants/destroy.html.erb
    redirect_to musicians_path
  end

  private

  def musician_params
    params.require(:musician).permit.(:first_name, :last_name, :birthday, :level, :instrument, :style, :zip_code, :user)
  end
end
