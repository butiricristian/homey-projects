class Project < ApplicationRecord
  enum status: [ :active, :inactive ]
end
