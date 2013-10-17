FactoryGirl.define do
	factory :user do
    sequence(:email) { |n| "test#{n}@example.com"}
		password 'password'
	end

  factory :stuff do
    assets { |a| [ a.association(:asset) ] }
    name 'Rails Development'
    user
  end

  factory :ticket do
    sequence(:email) { |n| "ticket#{n}@ticket.com" }
    token Faker::Lorem.sentence(20)
    association :stuff, factory: :stuff, strategy: :build
  end
  
  factory :comment do
    context Faker::Lorem.sentence(20)
  end

  factory :asset do
    avatar  { fixture_file_upload(Rails.root.join('spec', 'photos', 'test.jpg'), 'image/png') }
  end
end
