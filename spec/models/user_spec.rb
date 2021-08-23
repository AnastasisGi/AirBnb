# frozen_string_literal: true

require 'spec_helper'

describe User do
  describe 'authenticate ' do
    let(:username) { 'ausername' }
    let(:wrong_username) { 'clearlywrongusername' }
    let(:password) { 'takis123' }
    let(:wrond_password) { 'clearlythisiswrongpassword' }
    let(:user) { described_class.new(username: username) }

    before do
      user.password = password
      user.save!
    end

    it 'returns a user when is valid' do
      user = described_class.authenticate(username: username, password: password)
      expect(user).not_to eq nil
    end

    it 'returns nil when username is invalid' do
      user = described_class.authenticate(username: wrong_username, password: password)
      expect(user).to eq nil
    end

    it 'returns nil when password is invalid' do
      user = described_class.authenticate(username: username, password: wrond_password)
      expect(user).to eq nil
    end
  end
end
