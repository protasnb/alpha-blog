class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end
  
  def index
    @articles = Article.all
  end
  
  def edit
      @article = Article.find_by_id(params[:id])
      if @article == nil
        @article.errors.add(:id, 'does not exist')
        flash[:notice] = "Article not found!" 
      end
  end
  
  def update
    @article =  Article.find(params[:id])
    if @article
      if @article.update(article_params)
        flash[:notice] = "Article was successfully updated!" 
        redirect_to article_path(@article) 
      else
        render 'edit'
      end
    else
      render 'edit'
    end
  end
  
  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = "Article was successfully created!" 
      redirect_to article_path(@article)   
    else
      render 'new'
    end
  end
  
  def show
    @article = Article.find(params[:id])
  end

  private
  def article_params
    params.require(:article).permit(:title, :description)
  end
end