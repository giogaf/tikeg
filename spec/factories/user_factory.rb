FactoryGirl.define do 
	 factory :user do  
	 	sequence(:email) {|n| "email#{n}@gg.com"}
	 	password "passsap"
	 end
	 trait :administrador do 
	 	admin true
	 end
end
