# frozen_string_literal: true

class Project < ApplicationRecord
  has_many :comments, dependent: :destroy

  enum status: { active: 0, inactive: 1 }

  validates :title, presence: true
  validates :status, presence: true

  after_commit lambda {
                 broadcast_replace_to(
                   "project_status",
                   partial: "projects/project_status",
                   locals: { project: self },
                   target: "project_#{id}_status",
                 )
               }

  def next_status
    return :inactive if status.to_sym == :active

    :active
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
