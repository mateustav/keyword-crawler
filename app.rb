# frozen_string_literal: true

require_relative 'scraper.rb'
require_relative 'twitter_config.rb'
require_relative 'db_config.rb'

anitta = KeywordScraper.new('Anitta')
anitta.crawl_site('https://uol.com.br', '/')
anitta.track_instances
anitta.instances.each do |key, value|
  url = MySQL::CLIENT.escape(key)
  text = MySQL::CLIENT.escape(value)

  if MySQL.entry_exists?('anitta_instances', url)
    # Tweet.send_negative_tweet
  else
    MySQL.add_entry 'anitta_instances', url, text
    Tweet.send_positive_tweet(url)
  end
end

corona = KeywordScraper.new('Corona')
corona.crawl_site('https://uol.com.br', '/')
corona.track_instances
corona.instances.each do |key, value|
  url = MySQL::CLIENT.escape(key)
  text = MySQL::CLIENT.escape(value)

  if MySQL.entry_exists?('corona_instances', url)
    # Tweet.send_negative_tweet
  else
    # MySQL.add_entry 'corona_instances', url, text
    # Tweet.send_positive_tweet(url)
  end
end

# bolsonaro = KeywordScraper.new('Bolsonaro')
# bolsonaro.crawl_site('https://uol.com.br', '/')
# bolsonaro.track_instances
# bolsonaro.instances.each do |key, value|
#   url = MySQL::CLIENT.escape(key)
#   text = MySQL::CLIENT.escape(value)

#   if MySQL.entry_exists?('bolsonaro_instances', url)
#     Tweet.send_negative_tweet
#   else
#     MySQL.add_entry 'bolsonaro_instances', url, text
#     Tweet.send_positive_tweet(url)
#   end
# end
