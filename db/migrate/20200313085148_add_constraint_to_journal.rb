class AddConstraintToJournal < ActiveRecord::Migration[6.0]
  def change
    change_column :journal_entries, :title, :string, null: false
    change_column :journal_entries, :content, :text, null: false
  end
end
