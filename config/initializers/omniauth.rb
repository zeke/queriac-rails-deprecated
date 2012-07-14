Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, ENV['TWITTER_QUERIAC_CONSUMER_KEY'], ENV['TWITTER_QUERIAC_CONSUMER_SECRET']
end