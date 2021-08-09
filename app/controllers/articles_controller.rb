class ArticlesController < ApplicationController
    http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]
    layout :article_layout
    def index
      @articles = Article.all
  end
  def show
    @article = Article.find(params[:id])
    
    if not @article.nil?
        #flash.now[:alert] = "Your article is found"
    end
    
  end
  def new
     @article = Article.new
     #render body: "raw"
  end
  def create
     @article = Article.new(article_params)
     
     if @article.save
        flash[:success] = "Great! Your article has been created!"
        redirect_to @article
     else
        flash.now[:error] = "Rats! Fix your mistakes, please."
        render :new
     end
  end
  def edit
      @article = Article.find(params[:id])

  end
  def update
      @article =Article.find(params[:id])
      if @article.update(article_params)
          redirect_to @article
      else
          render :edit
      end
  end
  def destroy
      @article = Article.find(params[:id])
      @article.destroy

      redirect_to root_path
       
   end
  private
  def article_params
      params.require(:article).permit(:title, :body, :status)
  end
  def article_layout
    "application"
  end
end
