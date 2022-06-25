class PostsController < ApplicationController
  before_action :find_musician_nav
  before_action :find_orchestra_nav

  def new
    find_orchestra
    @post = Post.new

  end

  def create
    find_orchestra
    @post = Post.new(post_params)
    @post.orchestra = @orchestra
    if @post.type_post == "Recurrent"
      @post.tag_post = "Recurrent #{@post.instrument}-#{@post.level}"
    else
      @post.tag_post = "OneShot #{@post.instrument}-#{@post.level} for #{@post.date}"
    end

    if @post.save
      redirect_to orchestra_path(@orchestra)
    else
      render 'orchestras/show'
    end
  end


  def destroy
    find_post
    @post.destroy
    redirect_to root_path
  end

  def update
    find_post
  end


  private


  def post_params
    params.require(:post).permit(:instrument, :description, :level, :periodicity, :date, :type_post, :style)
  end

  def find_post
    @post = post.find(params[:id])
  end

  def find_orchestra
    @orchestra = Orchestra.find(params[:orchestra_id])
  end

    #nav bar
    def find_musician_nav
      @musician_nav = Musician.find_by(user_id: current_user.id)
    end

    def find_orchestra_nav
      @orchestra_nav = Orchestra.find_by(user_id: current_user.id)
    end


end
