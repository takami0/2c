class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.references :user, null: false, foreign_key: true
      t.references :category_medium, null: false, foreign_key: true
      t.references :category_style, null: false, foreign_key: true
      t.references :category_motif, null: false, foreign_key: true
      t.string :title, null: false
      t.text :introduction, null: false

      t.timestamps null: false
    end
  end
end
