class ApplicationController < ActionController::Base
  before_action :authenticate_user!,except: [:top]

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def after_sign_in_path_for(resource)
    user_path(resource)
    if @user.save
      flash[:notice] = 'Signed in successfully.'
      redirect_to user_path(@user.id)
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
  end


  def after_sign_out_path_for(resource)
    user_path(resource)
    if @user.save
      flash[:notice] = 'Signed out successfully.'
      redirect_to root_path
    end
  end
end
