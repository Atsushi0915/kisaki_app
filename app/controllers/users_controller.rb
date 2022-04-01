class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash.notice = "新規登録しました"
      redirect_to users_index_path
    else
      flash.alert = "登録失敗しました!!"
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
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
