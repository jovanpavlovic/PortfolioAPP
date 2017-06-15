class Blog < ApplicationRecord
  enum status: { draft: 0, published: 1}#vrednosti za draft i published blog
  extend FriendlyId
  friendly_id :title, use: :slugged #generise blog title link

  validates_presence_of :title, :body#ne dozvoljava da se napravi blog ako nema title i body

  belongs_to :topic #vise blogova pripada jednoj topic

  def self.special_blogs
    all
  end
end
