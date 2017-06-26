class Topic < ApplicationRecord
  validates_presence_of :title

  has_many :blogs#jedan topic ima vise blogova
  
  def self.with_blogs
    includes(:blogs).where.not(blogs: { id: nil })
  end
end 
