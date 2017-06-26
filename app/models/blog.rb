class Blog < ApplicationRecord
  enum status: { draft: 0, published: 1}#vrednosti za draft i published blog
  extend FriendlyId
  friendly_id :title, use: :slugged #generise blog title link

  validates_presence_of :title, :body, :topic_id#ne dozvoljava da se napravi blog ako nema title i body
  Rails.application.config.active_record.belongs_to_required_by_default = true

  belongs_to :topic #vise blogova pripada jednoj topic#!!!

  has_many :comments, dependent: :destroy

  def self.special_blogs
    all
  end

  def self.featured_blogs
    limit(2)
  end

  def self.recent
    order("created_at DESC")#kada je blog published
  end
end