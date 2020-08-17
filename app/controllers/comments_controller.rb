class CommentsController < ApplicationController
  def create
    
    @item = Item.new{"item_comments_path"}
    # @comment = Comment.create(comment_params)
    @comment.valid?
    @comment.errors
    if @comment.save
      redirect_to item_comments_path, notice: 'メッセージが送信されました'
    else
      @comments = @item.comments.includes(:user)
      flash.now[:alert] = 'メッセージを入力してください。'
      render :new
  end
end
private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
