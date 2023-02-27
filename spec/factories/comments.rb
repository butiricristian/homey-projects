FactoryBot.define do
  factory :user_comment do
    text { 'User Comment 1' }
    project
    user
  end

  factory :status_change_comment do
    text { 'Status Change Comment 1' }
    project
    user
  end
end