class ArticlesController < ApplicationController
  before_action :authenticate_user!

  def index
    if params[:search] && !params[:search].blank?
      @articles = Article.search(params[:search])
    else
      @articles = Article.order(:created_at)
    end

  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = current_user.articles.build
    @tag = @article.tags.build
     @tag.subtags.build
  end


  def create
    @article = current_user.articles.build(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def article_params
      params.require(:article).permit(:title, :description, tags_attributes: [:id, :name, :_destroy, subtags_attributes: [:id, :name, :_destroy]])
    end
end
