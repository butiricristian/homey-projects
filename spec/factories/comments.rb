# frozen_string_literal: true

FactoryBot.define do
  factory :user_comment do
    text { Faker::GreekPhilosophers.quote }
    project
    user
  end

  factory :status_change_comment do
    text { "Status Change Comment 1" }
    project
    user
  end
end

# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  text       :string
#  type       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  project_id :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_comments_on_project_id  (project_id)
#  index_comments_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (project_id => projects.id)
#  fk_rails_...  (user_id => users.id)
#
