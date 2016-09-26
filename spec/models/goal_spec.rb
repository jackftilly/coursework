# == Schema Information
#
# Table name: goals
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  body       :text             not null
#  complete   :boolean          default(FALSE)
#  private    :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Goal, type: :model do
  subject(:goal) do
    FactoryGirl.build(:goal,
      user_id: 1,
      private: true,
      body: "goal",
      complete: true)
  end
  subject(:goal2) do
    FactoryGirl.build(:goal,
      user_id: 1,
      private: false,
      body: "goal",
      complete: false)
  end

  it { should validate_presence_of(:body) }
  it { should validate_presence_of(:user) }

  it { should belong_to(:user) }

  describe "#private?" do

    it "returns true if goal is private" do
      expect(goal.private?).to be true
    end
    it "returns false if goal is not private" do
      expect(goal2.private?).to be false
    end
  end

  describe "#completed?" do

    it "returns true if goal is completed" do
      expect(goal.completed?).to be true
    end
    it "returns false if goal is not completed" do
      expect(goal2.completed?).to be false
    end
  end
end
