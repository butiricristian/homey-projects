# frozen_string_literal: true

require "rails_helper"

RSpec.describe(User, type: :model) do
  describe "validations" do
    context "when email is not present" do
      it "is not valid" do
        expect(build(:user, email: nil).valid?).to(be(false))
      end
    end

    context "when password is not present" do
      it "is not valid" do
        expect(build(:user, password: nil).valid?).to(be(false))
      end
    end
  end
end

# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
