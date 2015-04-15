class ArticlesController < ApplicationController
  include ArticlesHelper

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to article_path(@article)
      flash[:success] = "'#{@article.title} has been created!'"
    else
      flash[:error] = "'#{@article.title} could not be created.'"
      render :new
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:success] = "'#{@article.title}' has been updated!"
      redirect_to article_path(@article)
    else
      flash[:error] = "'#{@article.title}' could not be updated."
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash[:success] = "'#{@article.title} has been deleted.'"
    redirect_to articles_path(@article)
  end
end