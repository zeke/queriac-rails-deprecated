FactoryGirl.define do

  factory :command do
    keyword "g"
    url "https://www.google.com/search?q={{q}}"
    name "Google"
  end

end