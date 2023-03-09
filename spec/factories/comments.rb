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
