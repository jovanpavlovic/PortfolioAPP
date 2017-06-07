class PortfoliopagesController < ApplicationController
  def index
    @portfolio_items = Portfoliopage.all
  end
end
