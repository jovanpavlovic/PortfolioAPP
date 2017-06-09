class AddTopicReferenceToBlogs < ActiveRecord::Migration[5.1]
  def change
    add_reference :blogs, :topic, foreign_key: true#foreign_key referencing to topic table
  end
end
