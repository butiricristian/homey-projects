class Project < ApplicationRecord
  has_many :comments, dependent: :destroy

  enum status: [ :active, :inactive ]

  def next_status
    return :inactive if self.status.to_sym == :active
    return :active
  end
end
