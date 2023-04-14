class MemosController < ApplicationController
  before_action :check_guest

  def index
    @study = current_user.studies.find(params[:study_id])
  end

  def show
    @study = current_user.studies.find(params[:study_id])
    @memo = Memo.find(params[:id])
  end

  def new
    @study = current_user.studies.find(params[:study_id])
    @memo = Memo.new
  end

  def edit
    @study = current_user.studies.find(params[:study_id])
    @memo = current_user.memos.find(params[:id])
  end

  def create
    @study = current_user.studies.find(params[:study_id])
    @memo = Memo.new(memo_params)
    if @memo.save
      redirect_to study_memo_path(@study, @memo), success: t('defaults.message.created', item: Memo.model_name.human)
    else
      flash.now['danger'] = t('defaults.message.not_created', item: Memo.model_name.human)
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @study = current_user.studies.find(params[:study_id])
    @memo = current_user.memos.find(params[:id])
    if @memo.update(memo_params)
      redirect_to study_memo_path(@study, @memo), success: t('defaults.message.updated', item: Memo.model_name.human)
    else
      flash.now['danger'] = t('defaults.message.not_updated', item: Memo.model_name.human)
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @memo = current_user.memos.find(params[:id])
    @memo.destroy!
    redirect_to calendars_path, success: t('defaults.message.deleted', item: Memo.model_name.human), status: :see_other
  end

  private

  def memo_params
    params.require(:memo).permit(:body).merge(user_id: current_user.id, study_id: params[:study_id])
  end

  def check_guest
    redirect_to calendars_path, warning: t('defaults.message.require_login') if current_user.guest?
  end
end
