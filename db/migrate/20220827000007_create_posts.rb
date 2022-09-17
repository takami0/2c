class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.references :user, null: false, foreign_key: true
      t.references :category_medium, foreign_key: true
      t.references :category_style, foreign_key: true
      t.references :category_motif, foreign_key: true
      t.string :title, null: false
      t.text :introduction, null: false
      t.boolean :display_status, null: false, default: true
     
      t.timestamps null: false
    end
  end
end
