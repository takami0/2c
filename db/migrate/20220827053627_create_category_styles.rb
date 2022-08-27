class CreateCategoryStyles < ActiveRecord::Migration[6.1]
  def change
    create_table :category_styles do |t|

      t.timestamps
    end
  end
end
