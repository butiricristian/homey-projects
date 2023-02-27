class Project < ApplicationRecord
  has_many :comments, dependent: :destroy

  enum status: [ :active, :inactive ]
end
