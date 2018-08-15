class MemosController < ApplicationController
  def index
  	@memos = current_user.memos
  end

  def new
  	@memo = Memo.new
  end

  def create
	  @memo = current_user.memos.new memo_params
	  @memo.save!
	  redirect_to memos_url
	end

  def show
  	@memo = target_memo params[:id]
  end

  def edit
  	@memo = target_memo params[:id]
  end

	def update
	  @memo = target_memo params[:id]
	  @memo.update(memo_params)
	  redirect_to memos_url
	end

	def destroy
	  @memo = target_memo params[:id]
	  @memo.destroy
	  redirect_to memos_url
	end

private
	def target_memo memo_id
	  current_user.memos.where(id: memo_id).take
	end

	def memo_params
	  params.require(:memo).permit(:show_at, :content)
	end
end
