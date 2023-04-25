class ApplicationController < ActionController::Base
  add_flash_types :success, :info, :warning, :danger
  before_action :require_login
  before_action :check_user_active_status

  private

  def not_authenticated
    flash[:warning] = t('defaults.message.require_login')
    redirect_to login_path
  end

  def check_user_active_status
    if current_user && !current_user.is_active?
      logout
      flash[:alert] = t('defaults.message.user_is_not_active')
      redirect_to root_path
    end
  end
end
