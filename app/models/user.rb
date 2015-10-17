class User < ActiveRecord::Base
  class << self
    def from_omniauth(auth_hash)
      user = find_or_create_by(uid: auth_hash['uid'], provider: auth_hash['provider'])
      user.name = auth_hash['info']['name']
      user.location = auth_hash['info']['location']
      user.image_url = auth_hash['info']['image']
      user.url = auth_hash['info']['urls']['Twitter']
      user.save!
      user
    end
  end

  def tweet(tweet)
    client = Twitter::Client.new do |config|
      config.consumer_key = Rails.application.config.consumer_key
      config.consumer_secret = Rails.applicatoin.config.consumer_secret
      config.access_token = oauth_token
      config.access_token_secret = oauth_secret
    end
    client.update(tweet)
  end
end
