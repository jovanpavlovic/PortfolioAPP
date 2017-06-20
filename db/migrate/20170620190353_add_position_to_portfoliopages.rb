class AddPositionToPortfoliopages < ActiveRecord::Migration[5.1]
  def change
    add_column :portfoliopages, :position, :integer
  end
end
