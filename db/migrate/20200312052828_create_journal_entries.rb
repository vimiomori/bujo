class CreateJournalEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :journal_entries do |t|
      t.string :title
      t.date :date
      t.time :time
    end
  end
end
