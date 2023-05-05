class PasswordResetsController < ApplicationController
  skip_before_action :require_login
  before_action :get_user, only: [:edit, :update]
  before_action :check_expiration, only: [:edit, :update]

  def new; end

  def edit
    @token = params[:id]
    @user = User.load_from_reset_password_token(params[:id])
    return not_authenticated if @user.blank?
  end

  def create
    @user = User.find_by(email: params[:email])

    if @user
      @user.deliver_reset_password_instructions!
      redirect_to login_path, success: t('.success')
    else
      flash.now[:danger] = t('.email_not_found')
      render :new
    end
  end

  def update
    @token = params[:id]
    @user = User.load_from_reset_password_token(params[:id])
    return not_authenticated if @user.blank?

    @user.password_confirmation = params[:user][:password_confirmation]
    if @user.change_password(params[:user][:password])
      redirect_to login_path, success: t('.success')
    else
      flash.now[:danger] = t('.fail')
      render :edit
    end
  end

  private

  def get_user
    @user = User.find_by(reset_password_token: params[:id])
  end

  # トークンが期限切れかどうかを確認
  def check_expiration
    if @user.nil?
      flash[:alert] = t('password_resets.alerts.invalid_token')
      redirect_to new_password_reset_url
    elsif @user.reset_password_token_expires_at < Time.current
      flash[:alert] = t('password_resets.alerts.token_expired')
      redirect_to new_password_reset_url
    end
  end

end
