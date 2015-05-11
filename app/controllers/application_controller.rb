class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  load_and_authorize_resource except: [:home, :help, :about, :contact], unless: :devise_controller?

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, alert: exception.message
  end

  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  before_filter :set_user_language

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:name, :email, :password, :password_confirmation, :language)}
    devise_parameter_sanitizer.for(:account_update) {|u| u.permit(:name, :email, :password, :password_confirmation, :current_password, :language)}
  end

  def admin_user
    unless current_user.is_admin?
      flash[:danger] = "Please login as ADMIN!"
      redirect_to root_path
    end
  end

  def not_admin
    if current_user.is_admin?
      redirect_to root_path
    end
  end

  private
  def set_user_language
    I18n.locale = current_user.language if user_signed_in?
  end
end
