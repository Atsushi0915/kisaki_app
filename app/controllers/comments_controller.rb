class CommentsController < ApplicationController
  def create
    @comment = @current_user.comments.new(comment_params)
    if @comment.save
      flash.notice = "コメントを追記しました。"
      redirect_to post_show_path(@comment.post.id)
    else
      flash.alert = "コメント付きできませんでした。"
      render('posts/show')
    end
  end

  def destroy
  end

  private
    def comment_params
      params.require(:comment).permit(:comment_text, :post_id)
    end


end
