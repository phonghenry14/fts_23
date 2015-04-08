class Admin::ExaminationsController < ApplicationController
  before_action :admin_user

  def index
    @examinations = Examination.all.order("created_at DESC")
  end

  def show
    @examination = Examination.find params[:id]
  end

  def update
    @examination = Examination.find params[:id]
    answers_is_correct = Examination.check_correct_answers(examination_params,
                                                          @examination)
    answers_is_correct.each do |n|
      Answer.update(n, correct: true)
    end
    if @examination.update_attributes examination_params
      flash[:success] = "Successfully checked!"
      redirect_to root_path
    end
  end

  def destroy
    Examination.find(params[:id]).destroy
    flash[:success] = "Successfully examination deleted!"
    redirect_to admin_examinations_path
  end

  private
  def examination_params
    params.require(:examination).permit :id, :status,
                    answers_attributes: [:id, :question_id, :option_id, :correct]
  end
end
