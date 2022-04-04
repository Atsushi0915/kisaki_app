class UsersController < ApplicationController

  before_action :authenticate_user, {only: [:index, :show, :eidt]} #ログアウト中のユーザー
  before_action :forbit_login_user, {only: [:new, :create]}  #ログイン中のユーザー

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash.notice = "新規登録しました"
      redirect_to users_index_path
    else
      flash.alert = "登録失敗しました!!"
      render :new
    end
  end

  def index
    @users = User.all
  end

  def show
  end

  def edit
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :icon_image, :password, :password_confirmation)
    end
end
