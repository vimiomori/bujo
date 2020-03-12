class JournalEntry < ActiveRecord::Base
  validates :title, presence: true

end