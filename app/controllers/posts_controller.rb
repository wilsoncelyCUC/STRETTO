class PostsController < ApplicationController

  def new
    find_orchestra
    @post = Post.new

  end

  def create
    find_orchestra
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.orchestra = @orchestra
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

end
