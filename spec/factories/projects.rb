FactoryBot.define do
  factory :project do
    title { "Title 1" }
    description  { "Description 1" }
    status { :active }
  end
end
