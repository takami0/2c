class CreateCategoryMedia < ActiveRecord::Migration[6.1]
  def change
    create_table :category_media do |t|

      t.timestamps
    end
  end
end
