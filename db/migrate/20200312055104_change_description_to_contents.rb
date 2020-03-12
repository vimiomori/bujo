class ChangeDescriptionToContents < ActiveRecord::Migration[6.0]
  def change
    rename_column :journal_entries, :description, :content
  end
end
