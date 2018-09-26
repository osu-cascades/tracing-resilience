class RemoveDefaultTitleFromMeasures < ActiveRecord::Migration[5.2]
  def change
    change_column_default :measures, :title, nil
  end
end
