class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.references :send_user, null: false, foreign_key: false
      t.references :received_user, null: false, foreign_key: false
      t.references :comment, null: false, foreign_key: true
      t.references :bookmark, null: false, foreign_key: true
      t.integer :post_id
      t.references :follow, null: false, foreign_key: true
      t.string :action, null: false
      t.boolean :checked, null: false, default: "false"

      t.timestamps
    end
  end
end
