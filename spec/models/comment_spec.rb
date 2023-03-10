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

# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  text       :string
#  type       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  project_id :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_comments_on_project_id  (project_id)
#  index_comments_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (project_id => projects.id)
#  fk_rails_...  (user_id => users.id)
#
