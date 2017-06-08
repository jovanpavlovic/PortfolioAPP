class Blog < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged #generise blog title
end
