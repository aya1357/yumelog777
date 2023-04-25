class UsersController < ApplicationController
  skip_before_action :require_login, only: %i[new create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      auto_login(@user)
      redirect_to calendars_path, success: t('.success')
    else
      flash.now[:danger] = t('.fail')
      render :new
    end
  end

  def unsubscribe
    @user = User.find(current_user.id)
  end

  def withdrawal
    @user = User.find(current_user.id)
    @user.update(is_active: false)
    reset_session
    flash[:notice] = t('defaults.message.withdrawal')
    redirect_to root_path
  end

  protected

  def reject_user
    @user = User.find_by(name: params[:user][:name])
    if @user
      if @user.valid_password?(params[:user][:password]) && (@user.is_active == true)
        flash[:notice] = t('defaults.message.withdrew')
        redirect_to new_user_registration
      else
        flash[:notice] = "項目を入力してください"
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
