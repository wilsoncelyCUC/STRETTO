class OrchestrasController < ApplicationController
before_action :find_orchestra, only: [:show, :edit, :update, :destroy]

  def index
    @orchestras = Orchestra.all
  end

  def show
    @posts = @orchestra.posts
    @post = Post.new
  end

  def new
    @orchestra = Orchestra.new
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
    params.require(:orchestra).permit(:style, :type, :size, :zip_code, :frequency, :name, :description, :bio)
  end
end
