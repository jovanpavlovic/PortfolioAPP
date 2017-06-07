class PortfoliopagesController < ApplicationController
  def index
    @portfolio_items = Portfoliopage.all
  end

  def new
    @portfolio_item = Portfoliopage.new
  end

  def create
    @portfolio_item = Portfoliopage.new(params.require(:portfoliopage).permit(:title, :subtitle, :body))

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfoliopages_path, notice: 'Your portfolio item is now live.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
    @portfolio_item = Portfoliopage.find(params[:id])#hvata id portfolia
  end

 def update
    @portfolio_item = Portfoliopage.find(params[:id])

    respond_to do |format|
      if @portfolio_item.update(params.require(:portfoliopage).permit(:title, :subtitle, :body))
        format.html { redirect_to portfoliopages_path, notice: 'The record successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def show
    @portfolio_item = Portfoliopage.find (params[:id])#show za odredjeni portfolio
  end
end
