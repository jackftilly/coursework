FactoryGirl.define do
  factory :comment do
    factory :goalc do
      body "goal comment"
      commentable_id 1
      commentable_type "Goal"
      user_id 1
    end

    factory :userc do
      body "user comment"
      commentable_id 1
      commentable_type "User"
      user_id 1
    end
  end
end
