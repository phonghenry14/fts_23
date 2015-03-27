class StaticPagesController < ApplicationController
  def home
    if user_signed_in? && current_user.is_admin?
      redirect_to admin_examinations_path
    elsif user_signed_in?
      redirect_to examinations_path
    end
  end

  def help
  end

  def about
  end

  def contact
  end
end
