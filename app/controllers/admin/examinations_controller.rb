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
    answers_is_correct = Examination.check_correct_answers(examination_params_to_check,
                                      questions, params[:id])
    answers_is_correct.each do |n|
      Answer.update(n, correct: true)
    end
    flash[:success] = "Successfully checked!"
    redirect_to root_path
  end

  def destroy
    Examination.find(params[:id]).destroy
    flash[:success] = "Successfully examination deleted!"
    redirect_to admin_examinations_path
  end

  private
  def examination_params_to_check
    params.require(:examination).permit :id, :status,
                    answers_attributes: [:id, :question_id, :option_id]
  end
end
