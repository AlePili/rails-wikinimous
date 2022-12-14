class ArticlesController < ApplicationController
    before_action :set_article, only: [:show, :edit, :update, :destroy]

    def index
        @articles = Article.all
    end 

    def new
        @article = Article.new
    end 

    def show
        # @article = Artile.find(params[:id])
    end 

    def create
        @article = Article.new(article_params)
        if @article.save
            redirect_to @article
        else  
            render :new
        end 
    end

    def edit
        @article = Article.find(params[:id])
    end

    # def update
    #     @article = Article.find(params[:id])
    #     @article.update(article_params)
    #     redirect_to article_path(@article)
    # end

    def update
        if @article.update(article_params)
            redirect_to @article
        else 
         render :edit 
        end   
    end 

    def destroy
        @article = Article.find(params[:id])
        @restaurant.destroy
        redirect_to articles_path, status: :see_other
    end 


 private

    def article_params
        params.require(:article).permit(:title, :content)
    end 

    # def set_article
    #     @article = Article.find(params[:id])
    # end 
end



