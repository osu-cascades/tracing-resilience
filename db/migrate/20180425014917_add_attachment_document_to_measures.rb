class AddAttachmentDocumentToMeasures < ActiveRecord::Migration[5.1]
  def self.up
    change_table :measures do |t|
      t.attachment :document
    end
  end

  def self.down
    remove_attachment :measures, :document
  end
end
