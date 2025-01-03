class CreatePosts < ActiveRecord::Migration[8.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :image
      t.text :content
      t.string :random_id

      t.timestamps
    end
  end
end
