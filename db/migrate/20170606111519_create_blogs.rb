class CreateBlogs < ActiveRecord::Migration[5.1]
  def change
    create_table :blogs do |t|
      t.string :title
      t.text :body

      t.timestamps #kada kreiramo novi vlog rails cuva datum i update(kada napravimo neku izmenu)
    end
  end
end
