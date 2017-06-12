class PortfoliopagesController < ApplicationController
  def index
    @portfolio_items = Portfoliopage.all
    #where(subtitle: 'Ruby on Rails')
  end

  def angular
    @angular_portfolio_items = Portfoliopage.angular  
  end

  def new
    @portfolio_item = Portfoliopage.new
    3.times { @portfolio_item.technologies.build }
  end

  def create
    @portfolio_item = Portfoliopage.new(params.require(:portfoliopage).permit(:title, :subtitle, :body, technologies_attributes: [:name]))

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfoliopages_path, notice: 'Your portfolio item is now live.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
    @portfolio_item = Portfoliopage.find(params[:id])#hvata id portfolia//portfolio/4
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
                
   def destroy#ne treba poseban fajl zato sto radi destory
    @portfolio_item = Portfoliopage.find(params[:id])#lookup

    @portfolio_item.destroy#destroy/delete
    respond_to do |format|
      format.html { redirect_to portfoliopages_url, notice: 'Record was successfully removed.' }
    end
  end
end
