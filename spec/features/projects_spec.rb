# frozen_string_literal: true

require "rails_helper"

RSpec.feature("Projects", type: :feature) do
  describe "details page" do
    let(:user) { create(:user) }
    let(:project) { create(:project) }

    context "successful" do
      before do
        sign_in user
        visit project_path(project)
      end

      it "contains project details" do
        expect(page).to(have_css(".project-details"))
      end

      it "contains the comments form" do
        expect(page).to(have_css("form#new_comment"))
      end

      it "contains the comments list" do
        expect(page).to(have_css(".project-history"))
      end

      it "allows users to post a comment" do
        fill_in "comment[text]", with: "Lorem Ipsum"
        expect { click_button("Add comment") }.to(change { UserComment.count })
      end
    end
  end
end
