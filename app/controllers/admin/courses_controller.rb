class Admin::CoursesController < ApplicationController

  def index
    @courses = Course.paginate page: params[:page]
  end

  def new
    @course = Course.new
    question = @course.questions.build
    4.times { question.options.build }
  end

  def show
    @course = Course.find params[:id]
  end

  def create
    @course = Course.new course_params
    if @course.save
      flash[:success] = "Successfully created course!"
      redirect_to admin_course_path @course
    else
      flash[:notice] = "Found Error!"
      render :action => 'new'
    end
  end

  def edit
    @course = Course.find params[:id]
  end

  def update
    @course = Course.find params[:id]
    if @course.update_attributes course_params
      flash[:success] = "Successfully updated course!"
      redirect_to admin_course_path @course
    else
      flash[:danger] = "Found Error!"
      render :edit
    end
  end

  def destroy
    Course.find(params[:id]).destroy
    flash[:success] = "Course Deleted"
    redirect_to admin_courses_path
  end

  private
  def course_params
    params.require(:course).permit :id, :name,
          questions_attributes: [:id, :_destroy, :content,
                                options_attributes: [:id, :_destroy, :content, :correct]]
  end
end
