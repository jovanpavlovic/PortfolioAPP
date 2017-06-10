module Placeholder
  extend ActiveSupport::Concern

  def self.image_generator(height:, width:)#izbegavanje bagova prilikom pisanja dimenzija slika*(skill.rb)"http://via.placeholder.com/600x400"
    "http://via.placeholder.com/#{height}x#{width}"
  end
end