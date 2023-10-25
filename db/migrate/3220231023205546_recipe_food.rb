class RecipeFood < ActiveRecord::Migration[7.0]
    def change
      create_table :recipe_foods do |t|
        t.integer :quantity
        t.integer :recipe_id, foreign_key: { to_table: 'recipes' }
        t.references :food, null: false
        t.references :measurement_unit, null: false, foreign_key: { to_table: 'foods' }
  
        t.timestamps
      end
   end  
end
