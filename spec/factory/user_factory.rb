FactoryBot.define do
  
  factory :user do
    username { "testuser" }
    email {"test66@test.com" }
  
    factory :host do 
      transient do 
        set_password {'password'}
      end

      after(:create) do |user,evaluator|
        user.password=evaluator.set_password 
        user.save!

      end
    end
  
  
  end
end