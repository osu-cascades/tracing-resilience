# Removes paperclip columns from the model table.
# As the gem has likely been removed, this migration
# explicitly removes the columns. Undoing the migration
# requires the paperclip gem.
class RemoveAttachmentDocumentFromMeasures < ActiveRecord::Migration[5.2]
  def self.up
    remove_column :measures, :document_file_name
    remove_column :measures, :document_content_type
    remove_column :measures, :document_file_size
    remove_column :measures, :document_updated_at
  end

  def self.down
    change_table :measures do |t|
      t.attachment :document
    end
  end

end
