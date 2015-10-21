# require ''

FactoryGirl.define do
  factory :person  do
    transient do
      invalid false
    end

    name { invalid ? "" : Faker::Name.name }
  end

  factory :role do
    transient { invalid false }

    roles = ['executive producer', 'screenwriter', 'make-up artist']

    role { invalid ? "" : roles.sample }
    
    trait :actor do
      role "actor"
    end

    trait :director do
      role "director"
    end

    factory :actor, traits: [:actor]
    factory :director, traits: [:director]
  end


end