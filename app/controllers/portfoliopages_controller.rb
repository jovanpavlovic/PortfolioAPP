class PortfoliopagesController < ApplicationController
  before_action :set_portfolio_item, only: [:edit, :update, :show, :destroy]
  layout 'portfoliopage'
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
    @portfolio_item = Portfoliopage.new(portfoliopage_params)

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfoliopages_path, notice: 'Your portfolio item is now live.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
  end

 def update

    respond_to do |format|
      if @portfolio_item.update(portfoliopage_params)
        format.html { redirect_to portfoliopages_path, notice: 'The record successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def show
  end
                
   def destroy#ne treba poseban fajl zato sto radi destory
    @portfolio_item.destroy#destroy/delete
    respond_to do |format|
      format.html { redirect_to portfoliopages_url, notice: 'Record was successfully removed.' }
    end
  end

  private

  def portfoliopage_params
    params.require(:portfoliopage).permit(:title, 
                                          :subtitle, 
                                          :body, 
                                          technologies_attributes: [:name]
                                          )

  end 
  def set_portfolio_item
    @portfolio_item = Portfoliopage.find(params[:id])
  end
end