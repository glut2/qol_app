class Admin::UsersController < ApplicationController

  before_action :authenticate_user!
  before_action :set_user, only: %i( show edit update destroy )

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to admin_user_path(@user), notice: "ユーザ「#{@user.name}」を登録しました。"
    else
      redirect_to admin_users_url, alert: "ユーザ「#{@user.name}」を登録できませんでした。"
    end
  end

  def update
    if @user.update(user_params)
      redirect_to admin_user_path(@user), notice: "ユーザ「#{@user.name}」を更新しました。"
    else
      redirect_to admin_users_url, alert: "ユーザ「#{@user.name}」を更新できませんでした。"
    end
  end

  def destroy
    if @user.destroy
      redirect_to admin_users_url, notice: "ユーザ「#{@user.name}」を削除しました。"
    else
      redirect_to admin_users_url, alert: "ユーザ「#{@user.name}」を削除できませんでした。"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :admin, :department_id, :manager, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def require_admin
    redirect_to root_url unless current_user.admin?
  end
end
