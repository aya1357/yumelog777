class ProfilesController < ApplicationController
  before_action :set_user, only: %i[update edit]
  before_action :check_guest


  def edit; end

  def update
    if @user.update(user_params)
      redirect_to profile_path, success: t('defaults.message.updated', item: User.model_name.human)
    else
      flash.now['danger'] = t('defaults.message.not_updated', item: User.model_name.human)
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end

  def set_user
    @user = User.find(current_user.id)
  end

  def check_guest
    redirect_to calendars_path, warning: t('defaults.message.guest_login') if current_user.guest?
  end
end
