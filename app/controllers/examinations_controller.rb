class ExaminationsController < ApplicationController
  def index
    @examination = Examination.new
    @examinations = current_user.examinations
  end

  def new
  end

  def create
    @examination = Examination.new examination_params
    if @examination.save
      flash[:success] = "Successfully created Examination!"
      redirect_to root_path
    else
      flash[:notice] = "Found Error!"
      render :new
    end
  end

  private
  def examination_params
    params.require(:examination).permit :id, :user_id, :course_id
  end
end
