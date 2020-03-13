class AddUserToJournalEntries < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :journal_entries, :users, column: :user_id
  end
end
