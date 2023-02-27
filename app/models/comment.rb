class Comment < ApplicationRecord
  belongs_to :project
  belongs_to :user

  after_create_commit -> { broadcast_prepend_to "comments" }

  validates :text, presence: true
end
