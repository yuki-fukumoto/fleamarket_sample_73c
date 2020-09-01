class CommentsController < ApplicationController
  def create
    @item = Item.find(params[:item_id])
    @comment = Comment.new(comment_params)
    
    if @comment.save
      respond_to do |format|
      format.html{redirect_to (@item)}
      format.json
      end
    else
      redirect_to (@item), notice: 'コメントを入力してください'
    end
  end
    
private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
