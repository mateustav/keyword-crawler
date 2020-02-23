require 'twitter'

module Tweet
  CLIENT = Twitter::REST::Client.new do |config|
    config.consumer_key        = ENV['TWTR_CONSUMER_KEY']
    config.consumer_secret     = ENV['TWTR_CONSUMER_SECRET']
    config.access_token        = ENV['TWTR_ACCESS_TOKEN']
    config.access_token_secret = ENV['TWTR_ACCESS_TOKEN_SECRET']
  end

  def self.send_positive_tweet(url)
    CLIENT.update("Sim. #{url}")
  end

  def self.send_negative_tweet
    CLIENT.update('Não.')
  end
end
