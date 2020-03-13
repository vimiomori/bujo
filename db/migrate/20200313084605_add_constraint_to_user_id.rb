class AddConstraintToUserId < ActiveRecord::Migration[6.0]
  def change
    change_column :journal_entries, :user_id, :integer, { null: false }
  end
end
