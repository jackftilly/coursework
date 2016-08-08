FactoryGirl.define do
  factory :goal do
    user_id 1
    body "MyText"
    complete false
    private false
  end
end
