class Blog < ApplicationRecord
  enum status: { draft: 0, published: 1}#vrednosti za draft i published blog
  extend FriendlyId
  friendly_id :title, use: :slugged #generise blog title link

  validates_presence_of :title, :body#ne dozvoljava da se napravi blog ako nema title i body
end
