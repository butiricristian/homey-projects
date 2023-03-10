# frozen_string_literal: true

FactoryBot.define do
  factory :project do
    title { "Title 1" }
    description { "Description 1" }
    status { :active }
  end
end

# == Schema Information
#
# Table name: projects
#
#  id          :bigint           not null, primary key
#  description :string
#  status      :integer          default("active")
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
