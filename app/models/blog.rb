class Blog < ApplicationRecord
  enum status: { draft: 0, published: 1}#vrednosti za draft i published blog
  extend FriendlyId
  friendly_id :title, use: :slugged #generise blog title
end
