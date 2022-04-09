class PostsController < ApplicationController

  before_action :authenticate_user, {only: [:new, :create, :update, :destroy, :index, :show, :edit]} #ログアウト中のユーザー

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

  def update
    @post = Post.find_by(id: params[:id])
    if @post.update(post_params)
      flash.notice = "投稿更新しました"
      redirect_to post_show_path(@post.id)
    else
      flash.alert = "更新失敗しました"
      render :edit
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.del_flag = 1
    @post.save
    flash.notice = "削除しました"
    redirect_to posts_index_path
  end

  def index
    @post = Post.all
  end

  def show
    @post = Post.find_by(id: params[:id])
    @comment = Comment.new
    @comments = @post.comments
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  private 
    def post_params
      params.require(:post).permit(:title, :content, :post_image)
    end
end
