class Blog < ApplicationRecord
  enum status: { draft: 0, published: 1}#vrednosti za draft i published blog
  extend FriendlyId
  friendly_id :title, use: :slugged #generise blog title link

  validates_presence_of :title, :body#ne dozvoljava da se napravi blog ako nema title i body
  Rails.application.config.active_record.belongs_to_required_by_default = true

  belongs_to :topic, optional: true #vise blogova pripada jednoj topic#!!!

  def self.special_blogs
    all
  end

  def self.featured_blogs
    limit(2)
  end
end