# frozen_string_literal: true

require "rails_helper"

RSpec.describe(Project, type: :model) do
  describe "validations" do
    context "when title is not present" do
      it "is not valid" do
        expect(build(:project, title: nil).valid?).to(be(false))
      end
    end

    context "when status is not present" do
      it "is not valid" do
        expect(build(:project, status: nil).valid?).to(be(false))
      end
    end
  end

  describe "next_status" do
    let(:project) { build(:project, status: :active) }

    it "should return the other status" do
      expect(project.next_status).to(eq(:inactive))
    end
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
