# frozen_string_literal: true

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

User.create!(email: "admin@example.com", password: "admin1234")

Project.create!(
  title: "Project 1",
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. " \
    "Nam porta, nibh ac vehicula posuere, ex massa ullamcorper ligula, in egestas augue eros nec lacus",
)
Project.create!(
  title: "Project 2",
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. " \
    "Nam porta, nibh ac vehicula posuere, ex massa ullamcorper ligula, in egestas augue eros nec lacus",
)

UserComment.create!(text: "Comment number 1", project: Project.first, user: User.last)
UserComment.create!(text: "Comment number 2", project: Project.first, user: User.last)
StatusChangeComment.create!(text: "changed status from active to inactive", project: Project.first, user: User.last)
StatusChangeComment.create!(text: "changed status from inactive to active", project: Project.first, user: User.last)

UserComment.create!(text: "Comment number 1", project: Project.second, user: User.last)
UserComment.create!(text: "Comment number 2", project: Project.second, user: User.last)
StatusChangeComment.create!(text: "changed status from active to inactive", project: Project.second, user: User.last)
StatusChangeComment.create!(text: "changed status from inactive to active", project: Project.second, user: User.last)
