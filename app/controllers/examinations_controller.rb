class ExaminationsController < ApplicationController
  before_action :not_admin

  def index
    @examination = Examination.new
    @examinations = current_user.examinations.order "created_at DESC"
    @examinations = @examinations.paginate page: params[:page], per_page: 8
  end

  def create
    if current_user.examinations.count == 0
      @examination = Examination.new examination_params
      if @examination.save
        Examination.init_answers @examination
        flash[:success] = "Successfully created Examination!"
        redirect_to root_path
      else
        flash[:notice] = "Found Error!"
        redirect_to root_path
      end
    else
      if current_user.examinations.last.status == "Ready"
        redirect_to root_path
      else
        @examination = Examination.new examination_params
        if @examination.save
          Examination.init_answers(@examination)
          flash[:success] = "Successfully created Examination!"
          redirect_to root_path
        else
          flash[:notice] = "Found Error!"
          redirect_to root_path
        end
      end
    end
  end

  def show
    @examination = Examination.find params[:id]
    if (Time.zone.now() - @examination.time_start) > @examination.course.time_countdown
      respond_to do |format|
        format.html
        format.csv {send_data @examination.to_csv}
      end
    else
      if @examination.current_session_id != session[:session_id]
        flash[:danger] = "User is testing!"
        redirect_to root_path
      else
        respond_to do |format|
          format.html
          format.csv {send_data @examination.to_csv}
        end
      end
    end
  end

  def update
    @examination = Examination.find params[:id]
    if (@examination.status == "Ready")
      @examination.status = "Submited"
      @examination.time_start = Time.zone.now()
      @examination.current_session_id = session[:session_id]
      @examination.save
    else
      @examination.time_end = Time.zone.now()
      @examination.time_submited = @examination.time_end - @examination.time_start
      if @examination.update_attributes examination_params_to_answer
        flash[:success] = "Successfully summited!"
        redirect_to root_path
      else
        flash[:danger] = "Found Error!"
        render :show
      end
    end

  end

  private
  def examination_params
    params.require(:examination).permit :id, :user_id, :course_id, :status, :time_submited
  end

  def examination_params_to_answer
    params.require(:examination).permit :id, :status, :time_submited, :time_start, :time_end,
                    answers_attributes: [:id, :question_id, :option_id, :text_answers]
  end
end
