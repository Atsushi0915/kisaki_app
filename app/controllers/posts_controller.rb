class PostsController < ApplicationController
  def top
  end

  def new
    @post = Post.new
  end

  def create
    @post = @current_user.posts.build(post_params)
    @post.user_id = @current_user.id
    if @post.save
      flash.notice = "新規投稿しました"
      redirect_to posts_index_path
    else
      flash.alert = "投稿失敗しました"
      render :new
    end
  end

  def index
  end

  def show
  end

  def edit
  end

  private 
    def post_params
      params.require(:post).permit(:title, :content, :post_image)
    end
end
