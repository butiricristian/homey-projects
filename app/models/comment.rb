# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :project
  belongs_to :user

  after_create_commit -> { broadcast_prepend_to("comments", locals: { comment: self }, target: "comments") }

  validates :text, presence: true

  scope :ordered, -> { order(created_at: :desc) }
end
