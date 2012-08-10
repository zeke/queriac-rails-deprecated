FactoryGirl.define do

  factory :command do
    user
    keyword "g"
    script "window.location='https://www.google.com/search?q='+args.join(' ');"
    name "Google"
  end

end