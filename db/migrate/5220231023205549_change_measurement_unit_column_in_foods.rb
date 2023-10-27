class ChangeMeasurementUnitColumnInFoods < ActiveRecord::Migration[7.0]
  def change
    change_column_null :foods, :measurement_unit, true
  end
end
