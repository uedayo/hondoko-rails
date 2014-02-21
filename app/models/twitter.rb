class Twitter
  require 'open-uri'
  require 'json'

  def self.find screen_name
    content = open(TWITTER_USER_LOOKUP + screen_name).read
    JSON.parse(content).first
  end
end