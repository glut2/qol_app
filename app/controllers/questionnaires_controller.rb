class QuestionnairesController < ApplicationController
  def index
    @questionnaires = Questionnaire.all
  end

  def show
    @questionnaire = Questionnaire.find(params[:id])
  end

  def new
    @questionnaire = Questionnaire.new
  end

  def edit
    @questionnaire = Questionnaire.find(params[:id])
  end

  def create
    questionnaire = Questionnaire.new(questionnaire_params)
    questionnaire.save!
    redirect_to root_url, notice: "問診票に回答しました。"
  end

  def update
    questionnaire = Questionnaire.find(params[:id])
    questionnaire.update!(questionnaire_params)
    redirect_to questionnaires_url, notice: "問診票の回答を更新しました。"
  end

  def destroy
    questionnaire = Questionnaire.find(params[:id])
    questionnaire.destroy
    redirect_to questionnaires_url, notice: "問診票の回答を削除しました。"
  end

  private

  def questionnaire_params
    params.require(:questionnaire).permit(:mobility, :self_care, :usual_activities, :pain, :anxiety)
  end
end
