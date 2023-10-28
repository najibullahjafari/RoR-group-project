class ChangeMeasurementUnitIdInRecipeFoodss < ActiveRecord::Migration[7.0]
  def change
    change_column :recipe_foods, :measurement_unit_id, :integer, null: true
  end
end
