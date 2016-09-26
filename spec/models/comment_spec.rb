require 'rails_helper'

RSpec.describe Comment, type: :model do

  it { should belong_to(:user) }
  it { should belong_to(:commentable) }
  it { should validate_presence_of(:body) }
  it { should validate_presence_of(:commentable) }
  it { should validate_presence_of(:user) }

  describe "#comment_type" do
    let(:user) { FactoryGirl.create(:user)}
    let(:uc) { FactoryGirl.create(:userc ) }
    let(:gc) { FactoryGirl.create(:goalc) }
    it "returns the type of comment" do
      expect(uc.comment_type).to eq('User')
      expect(gc.comment_type).to eq('Goal')
    end
  end
end
