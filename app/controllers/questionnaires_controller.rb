class QuestionnairesController < ApplicationController

  before_action :set_questionnaire, only: %i( show edit destroy)

  def index
    @questionnaires = Questionnaire.all
  end

  def show
  end

  def new
    @questionnaire = Questionnaire.new
  end

  def edit
  end

  def create
    questionnaire = Questionnaire.new(questionnaire_params)
    if questionnaire.save
      redirect_to root_url, notice: "問診票に回答しました。"
    else
      redirect_to root_url, alert: "問診票に回答できませんでした。"
    end
  end

  def update
    questionnaire = Questionnaire.find(params[:id])
    if questionnaire.update(questionnaire_params)
      redirect_to questionnaires_url, notice: "問診票の回答を更新しました。"
    else
      redirect_to questionnaires_url, alert: "問診票の回答を更新できませんでした。"
    end
  end

  def destroy
    if questionnaire.destroy
      redirect_to questionnaires_url, notice: "問診票の回答を削除しました。"
    else
      redirect_to questionnaires_url, alert: "問診票の回答を削除できませんでした。"
  end

  def set_questionnaire
    @questionnaire = Questionnaire.find(params[:id])
  end

  private

  def questionnaire_params
    params.require(:questionnaire).permit(:mobility, :self_care, :usual_activities, :pain, :anxiety)
  end
end
