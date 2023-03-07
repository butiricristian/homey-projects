# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { "user1@example.com" }
    password { "pass1234" }
  end
end
