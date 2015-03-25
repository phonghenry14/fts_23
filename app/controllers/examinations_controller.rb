class ExaminationsController < ApplicationController
  def index
    @examination = Examination.new
    @examinations = current_user.examinations
  end

  def create
    @examination = Examination.new examination_params
    if @examination.save
      flash[:success] = "Successfully created Examination!"
      redirect_to root_path
    else
      flash[:notice] = "Found Error!"
      redirect_to root_path
    end
  end

  def show
    @examination = Examination.find params[:id]
    @answers = @examination.answers
  end

  def update
    @examination = Examination.find params[:id]
    if @examination.update_attributes examination_params_to_answer
      flash[:success] = "Successfully summited!"
      redirect_to root_path
    else
      flash[:danger] = "Found Error!"
      render :show
    end
  end

  private
  def examination_params
    params.require(:examination).permit :id, :user_id, :course_id
  end

  def examination_params_to_answer
    params.require(:examination).permit :id,
                    answers_attributes: [:id, :question_id, :option_id]
  end
end
