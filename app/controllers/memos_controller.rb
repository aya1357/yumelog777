class MemosController < ApplicationController
  def index
    @habit = current_user.habits.find(params[:habit_id])
  end

  def new
    @habit = current_user.habits.find(params[:habit_id])
    @memo = Memo.new
  end

  def create
    @habit = current_user.habits.find(params[:habit_id])
    @memo = Memo.new(memo_params)
    if @memo.save
      redirect_to habit_memo_path(@habit, @memo), success: t('defaults.message.created', item: Memo.model_name.human)
    else
      flash.now['danger'] = t('defaults.message.not_created', item: Memo.model_name.human)
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @habit = current_user.habits.find(params[:habit_id])
    @memo = Memo.find(params[:id])
  end

  def edit
    @habit = current_user.habits.find(params[:habit_id])
    @memo = current_user.memos.find(params[:id])
  end

  def update
    @habit = current_user.habits.find(params[:habit_id])
    @memo = current_user.memos.find(params[:id])
    if @memo.update(memo_params)
      redirect_to habit_memo_path(@habit, @memo), success: t('defaults.message.updated', item: Memo.model_name.human)
    else
      flash.now['danger'] = t('defaults.message.not_updated', item: Memo.model_name.human)
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @habit = current_user.habits.find(params[:habit_id])
    @memo = current_user.memos.find(params[:id])
    @memo.destroy!
    redirect_to habit_memos_path, success: t('defaults.message.deleted', item: Memo.model_name.human), status: :see_other
  end

  private

  def memo_params
    params.require(:memo).permit(:body).merge(user_id: current_user.id, habit_id: params[:habit_id])
  end
end
