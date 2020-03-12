class AddDescriptionToJournalEntries < ActiveRecord::Migration[6.0]
  def change
    add_column :journal_entries, :description, :text
    add_column :journal_entries, :created_at, :datetime
    add_column :journal_entries, :updated_at, :datetime
  end
end
