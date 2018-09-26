# Adds a `description` field with NOT NULL and default values for existing
# records, and then removes the default value.
class AddDescriptionAndDetailsToMeasures < ActiveRecord::Migration[5.2]
  def change
    add_column :measures, :description, :string, null: false, default: ''
    change_column_default :measures, :description, nil
    add_column :measures, :details, :text
  end
end
