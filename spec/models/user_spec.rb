require 'rails_helper'

RSpec.describe User, type: :model do

  subject(:user) do
    FactoryGirl.build(:user,
      username: 'test',
      password: "password")
  end
  it { should validate_presence_of(:username)}
  it {should validate_presence_of(:password_digest)}
  it {should validate_presence_of(:session_token)}
  it {should validate_length_of(:password).is_at_least(6)}

  it { should have_many :goals }
  it { should have_many :comments }

  describe "#is_password?" do
    it "should correclty verify a password" do
      expect(user.is_password?('password')).to be true
    end

    it "should return false if password is wrong" do
      expect(user.is_password?('wrong')).to be false
    end
  end

  describe "::find_by_credentials" do
    before { user.save }
    it "correctly returns user if found" do
      found = User.find_by_credentials("test", "password")
      expect(found).to eq(user)
    end

    it "returns nil if no user is found" do
      found = User.find_by_credentials('a', 'password')
      expect(found).to_not be user
    end
  end

  describe "#reset_session_token!" do
    it "correctly resets token" do
      old = user.session_token
      expect(user.reset_session_token!).to_not eq(old)
    end
  end



end
