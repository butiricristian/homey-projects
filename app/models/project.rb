class Project < ApplicationRecord
  has_many :comments, dependent: :destroy

  enum status: %i[active inactive]

  validates :title, presence: true
  validates :status, presence: true

  def next_status
    return :inactive if status.to_sym == :active

    :active
  end
end
