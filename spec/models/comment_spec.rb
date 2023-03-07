# frozen_string_literal: true

require "rails_helper"

RSpec.describe(Comment, type: :model) do
  describe "validations" do
    context "when text is not present" do
      it "is not valid" do
        expect(build(:user_comment, text: nil).valid?).to(be(false))
      end
    end
  end

  describe "broadcast updates" do
    it "should broadcast user comment updates" do
      expect { create(:user_comment) }.to(have_broadcasted_to("comments"))
    end

    it "should broadcast status change comment updates" do
      expect { create(:status_change_comment) }.to(have_broadcasted_to("comments"))
    end
  end
end
