class CreateFollows < ActiveRecord::Migration[6.1]
  def change
    create_table :follows do |t|
      t.references :user, null: false, foreign_key: true
      t.references :follow_user, null: false, foreign_key: false

      t.timestamps
    end
  end
end
