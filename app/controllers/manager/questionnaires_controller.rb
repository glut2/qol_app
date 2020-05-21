class Manager::QuestionnairesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_questionnaire, only: %i( show edit update destroy )

  def index
    @questionnaires = current_user.questionnaires.recent
  end

  def show
  end

  def new
    @questionnaire = Questionnaire.new
  end

  def edit
  end

  def administrate
    @questionnaires = Questionnaire.all.recent
  end

  def manage
    @questionnaires = Questionnaire.joins(:user).where("users.department_id = #{current_user.department_id}").recent
  end

  def create
    questionnaire = current_user.questionnaires.new(questionnaire_params)
    if questionnaire.save
      redirect_to root_url, notice: "問診票に回答しました。"
    else
      redirect_to root_url, alert: "問診票に回答できませんでした。"
    end
  end

  def update
    if @questionnaire.update(questionnaire_params)
      redirect_to admin_questionnaires_administrate_path, notice: "問診票の回答を更新しました。"
    else
      redirect_to admin_questionnaires_administrate_path, alert: "問診票の回答を更新できませんでした。"
    end
  end

  def destroy
    if @questionnaire.destroy
      redirect_to admin_questionnaires_administrate_path, notice: "問診票の回答を削除しました。"
    else
      redirect_to admin_questionnaires_administrate_path, alert: "問診票の回答を削除できませんでした。"
    end
  end

  def set_questionnaire
    @questionnaire = Questionnaire.find(params[:id])
  end

  private

  def questionnaire_params
    params.require(:questionnaire).permit(:mobility, :self_care, :usual_activities, :pain, :anxiety)
  end
end
