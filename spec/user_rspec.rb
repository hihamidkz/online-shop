require 'rails_helper'
require 'user'

describe User do
  fixtures :all

  describe 'validations' do
    let (:user) { users(:first) }

    it 'is ok' do
      expect(user).to be_valid
    end

    it 'password is too short' do
      user.encrypted_password = 'pass'
      expect(user).to_not be_valid
      expect(user).to ensure_length_of(:encrypted_password)
    end

    it 'email is incorrect' do
      user.email = 'myemail'
      expect(user).to_not be_valid
      expect(user).to_not allow_value(user.email).for(:email)
    end
  end
end
