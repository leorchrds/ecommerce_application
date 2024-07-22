require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validate the required fields before submitting the form' do
    it 'validate that the name field is present' do
      user = build(:user)

      expect(user.valid?).to eq(true)
    end

    it 'validate that the name field is not present' do
      user = build(:user, name: nil)

      expect(user.valid?).to eq(false)
    end

    it 'validate that the phone field is not present' do
      user = build(:user, phone: nil)

      expect(user.valid?).to eq(false)
    end

    it 'Validate that the email field is present' do
      user = build(:user)

      expect(user.valid?).to eq(true)
    end

    it 'validate that the email field is not present' do
      user = build(:user, email: nil)

      expect(user.valid?).to eq(false)
    end

    it 'Validate that the password field is present' do
      user = build(:user)

      expect(user.valid?).to eq(true)
    end

    it 'Validate that the password field is not present' do
      user = build(:user, password: nil)

      expect(user.valid?).to eq(false)
    end

    context 'Validate email' do
      it 'Validate unique emails' do
        user1 = create(:user)
        user2 = build(:user, email: user1.email)

        expect(user2.valid?).to eq(false)
      end

      it 'Validate error message for unique emails' do
        user1 = create(:user)
        user2 = build(:user, email: user1.email)

        user2.save

        expect(user2.valid?).to eq(false)
        expect(user2.errors.size).to be_positive
      end
    end
  end
end
