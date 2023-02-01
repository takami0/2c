class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.references :send_user, null: false, foreign_key: false
      t.references :received_user, null: false, foreign_key: false
      t.string :action, null: false
      t.boolean :checked, null: false, default: "false"
      t.references :comment, foreign_key: true
      t.references :bookmark, foreign_key: true
      t.integer :post_id
      t.references :follow, foreign_key: true


      t.timestamps
    end
  end
end
