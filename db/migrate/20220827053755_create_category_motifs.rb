class CreateCategoryMotifs < ActiveRecord::Migration[6.1]
  def change
    create_table :category_motifs do |t|

      t.timestamps
    end
  end
end
