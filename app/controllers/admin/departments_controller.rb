class Admin::DepartmentsController < ApplicationController
  
  before_action :authenticate_user!
  before_action :set_department, only: %i( show edit update destroy )

  def index
    @departments = Department.all
  end

  def show
  end

  def new
    @department = Department.new
  end

  def edit
  end

  def create
    @department = Department.new(department_params)
    if @department.save
      redirect_to admin_departments_path, notice: "新たな部署として、「#{@department.name}」を登録しました。"
    else
      redirect_to admin_departments_path, alert: "新たな部署として「#{@department.name}」を登録できませんでした。"
    end
  end

  def update
    if @department.update(department_params)
      redirect_to admin_departments_path, notice: "「#{@department.name}」の情報を更新しました。"
    else
      redirect_to admin_departments_path, alert: "「#{@department.name}」の情報を更新できませんでした。"
    end
  end

  def destroy
    if @department.destroy
      redirect_to admin_departments_path, notice: "部署「#{@department.name}」の情報を削除しました。"
    else
      redirect_to admin_departments_path, alert: "部署「#{@department.name}」の情報を削除できませんでした。"
    end
  end

  private

  def department_params
    params.require(:department).permit(:name, :description)
  end

  def set_department
    @department = Department.find(params[:id])
  end

  def require_admin
    redirect_to root_url unless current_user.admin?
  end
end
