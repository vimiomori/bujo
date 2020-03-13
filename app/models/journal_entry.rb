class JournalEntry < ActiveRecord::Base
  belongs_to :user
  validates :title,   presence: true, length: { minimum: 3, maximum: 50 }
  validates :content, presence: true
  validates :user_id, presence: true
end