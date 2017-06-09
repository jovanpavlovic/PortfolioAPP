class Portfoliopage < ApplicationRecord
  include Placeholder
  validates_presence_of :title, :body, :main_image, :thumb_image

  def self.angular
    where(subtitle: 'Angular')
  end

  scope :ruby_on_rails_portfolio, -> {where(subtitle: 'Ruby on Rails')}
  #custom scope, 

  after_initialize :set_defaults

  def set_defaults
    self.main_image ||= Placeholder.image_generator(height: '600', width: '400')#self znaci kada god kreiramo novi portfoliopage item, pojavljuje se slika iako je ne dodamo
    self.thumb_image ||= Placeholder.image_generator(height: '350', width: '200') # ||= ako je self image null onda postavlja sliku

  end
end
