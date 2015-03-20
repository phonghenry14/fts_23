class Admin::CoursesController < ApplicationController
  def new
    @course = Course.new
    question = @course.questions.build
    4.times { question.options.build }
  end

  def create
    @course = Course.new course_params
    if @course.save
      flash[:success] = "Successfully created survey!"
      redirect_to admin_course_path @course
    else
      flash[:notice] = "Found Error!"
      render :action => 'new'
    end
  end

  private
  def course_params
    params.require(:course).permit :name,
          questions_attributes: [:_destroy, :content,
                                options_attributes: [:_destroy, :content, :correct]]
  end
end
