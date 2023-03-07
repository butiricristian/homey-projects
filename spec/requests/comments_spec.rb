# frozen_string_literal: true

require "rails_helper"

RSpec.describe("Comments", type: :request) do
  let!(:project) { create(:project) }
  let(:valid_attributes) { { text: "Comment 1" } }
  let(:invalid_attributes) { { text: "" } }

  let(:user) { create(:user) }
  before(:each) do
    sign_in user
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Comment" do
        expect do
          post(project_comments_url(project), params: { comment: valid_attributes })
        end.to(change(UserComment, :count).by(1))
      end

      it "renders the new template" do
        post project_comments_url(project), params: { comment: valid_attributes }
        expect(response).to(have_http_status(:success))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Project" do
        expect do
          post(project_comments_url(project), params: { comment: invalid_attributes })
        end.to(change(UserComment, :count).by(0))
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post project_comments_url(project), params: { comment: invalid_attributes }
        expect(response).to(have_http_status(:unprocessable_entity))
      end
    end
  end
end
