require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    context 'when email is not present' do
      it 'is not valid' do
        expect(build(:user, email: nil).valid?).to be false
      end
    end

    context 'when password is not present' do
      it 'is not valid' do
        expect(build(:user, password: nil).valid?).to be false
      end
    end
  end
end
