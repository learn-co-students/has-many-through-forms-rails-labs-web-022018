class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def update
    @post = Post.find(params[:id])
    if params["post"]["users_attributes"]["0"]["username"].empty?
      user = User.find_or_create_by(id: params["post"]["users"])
      @comment = Comment.create(content: params["post"]["comments_attributes"]["0"]["content"], user_id: user.id)
    else
      user = User.find_or_create_by(username: params["post"]["users_attributes"]["0"]["username"])
      @comment = Comment.create(content: params["post"]["comments_attributes"]["0"]["content"], user_id: user.id)
    end

    @post.comments << @comment
    # if @post.update(post_params)
    #   redirect_to post_path(@post)
    # else
    #   render :show
    # end
    redirect_to post_path(@post)
  end

  def create
    post = Post.new(post_params)

    if post.save
      redirect_to post
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, category_ids:[], categories_attributes: [:name], user_attributes: [:username], comments_attributes: [:content])
  end
end
