class Admin::ExaminationsController < ApplicationController
  def new
    @examination = Examination.new
  end

  def create
    @examination = Examination.new examination_params
    if @examination.save
      flash[:success] = "Successfully created survey!"
      redirect_to admin_examination_path @examination
    else
      flash[:notice] = "Found Error!"
      render :new
    end
  end
end
