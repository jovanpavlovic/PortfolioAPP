require 'linkedin'

class PagesController < ApplicationController
  def home
    @posts = Blog.all
    @skills = Skill.all
  end

  def about
    client = LinkedIn::Client.new(ENV['LINKEDIN_CONSUMER_KEY'],ENV['LINKEDIN_CONSUMER_SECRET'])#api ima pristup svim podacima 
    client.authorize_from_access(ENV['LINKEDIN_KEY1'], ENV['LINKEDIN_KEY2'])    
    @profile = client.profile
  end

  def contact
  end

  def tech_news
    @tweets = SocialTool.twitter_search
  end
end
