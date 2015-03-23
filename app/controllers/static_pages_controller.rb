class StaticPagesController < ApplicationController
  def home
    @examination = Examination.new
    @examinations = current_user.examinations
  end

  def help
  end

  def about
  end

  def contact
  end
end
