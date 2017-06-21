class Portfoliopage < ApplicationRecord
  has_many :technologies
  accepts_nested_attributes_for :technologies, 
                                reject_if: lambda {|attrs| attrs['name'].blank? }#ako je tehnlogija blank-f

  validates_presence_of :title, :body

  mount_uploader :thumb_image, PortfoliopageUploader#portfolio poziva carriervawe gem
  mount_uploader :main_image, PortfoliopageUploader

  def self.angular
    where(subtitle: 'Angular')
  end

  def self.by_position
    order("position ASC")#ascending pozicija portfolia
  end

  scope :ruby_on_rails_portfolio, -> {where(subtitle: 'Ruby on Rails')}
  #custom scope
  end