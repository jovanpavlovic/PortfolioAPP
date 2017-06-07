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

end
