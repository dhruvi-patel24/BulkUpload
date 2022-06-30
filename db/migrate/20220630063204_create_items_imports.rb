class CreateItemsImports < ActiveRecord::Migration[7.0]
  def change
    create_table :items_imports do |t|

      t.timestamps
    end
  end
end
