class AddUserIdToJournalEntries < ActiveRecord::Migration[6.0]
  def change
    add_column :journal_entries, :user_id, :integer
  end
end
