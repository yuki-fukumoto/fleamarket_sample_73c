class CommentsController < ApplicationController
  def create
    @item = Item.find(params[:item_id])
    @comment = Comment.new(comment_params)
    
    if @comment.invalid?
      redirect_to (@item),alert: @comment.errors.full_messages
    else
      @comment.save!
      redirect_to (@item), notice: 'コメントが投稿されました'
    end
   
  end
    
private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
