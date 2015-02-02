class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # Devise strong parameters
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def after_sign_in_path_for(resource)
    show_user_path resource.username
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [:username, :first_name, :last_name, :gender, :birthday, :function, :biography, :city, :country]
  end
end
