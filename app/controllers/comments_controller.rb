class CommentsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.new(comment_params)
    @comment.user = current_user
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @article, notice: 'Comment was created successfully.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { redirect_to @article, alert: 'Comment was not saved successfully.' }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
    # redirect_to article_path (@article)
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end

  private
    def comment_params
      params.require(:comment).permit(:user_id, :commenter, :body)
    end
end
