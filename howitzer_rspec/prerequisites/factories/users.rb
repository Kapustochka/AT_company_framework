FactoryBot.define do
  factory :user do
    email { "u#{Gen.serial[-4..-1]}@#{Howitzer.mailgun_domain}" }
    password { Howitzer.app_test_pass }
    name { 'maxim-user' }
    last_name { 'maxim-userlastname' }

    trait :default do
      initialize_with { User.default || User.new }
    end
  end
end
