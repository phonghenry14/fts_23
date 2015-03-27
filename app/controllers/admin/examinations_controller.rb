class Admin::ExaminationsController < ApplicationController
  before_action :admin_user

  def index
    @examinations = Examination.all
  end

  def show
    @examination = Examination.find params[:id]
  end

  def update
    @examination = Examination.find params[:id]
    questions = @examination.course.questions
    Examination.check_correct_answers(examination_params_to_check,
                                      questions, params[:id])
    flash[:success] = "Successfully checked!"
    redirect_to root_path
  end

  private
  def examination_params_to_check
    params.require(:examination).permit :id, :status,
                    answers_attributes: [:id, :question_id, :option_id]
  end
end
