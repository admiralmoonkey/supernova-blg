class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  load_and_authorize_resource
  def index
    @articles = Article.all.paginate(page: params[:page], per_page: 3)
  end

  def show
    @article = Article.find(params[:id])
    @comments = @article.comments.all.paginate(page: params[:page], per_page: 5)
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article, notice: "The article has been successfully created"
    else
      render 'new'
    end
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article, notice: "The article has been successfully updated."
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

  private
    def article_params
      params.require(:article).permit(:user_id, :title, :text)
    end
end
