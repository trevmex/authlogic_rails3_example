# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :user, :class => User do |f|
  f.sequence(:name) {|l| "Testor#{l}"}
  f.sequence(:email) {|l| "test#{l}@testor.com"}
  f.password "123456"
  f.password_confirmation "123456"
  f.sequence(:persistence_token) {|l| "#{Authlogic::Random.hex_token}"}
end

Factory.define :invalid_user, :class => User do |f|
end