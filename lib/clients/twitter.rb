class Clients::Twitter

  def self.client
    @@client = Twitter::REST::Client.new do |config|
      config.consumer_key    = ENV['TWITTER_CONSUMER_KEY']
      config.consumer_secret = ENV['TWITTER_SECRET_KEY']
      config.bearer_token    = ENV['TWITTER_BEARER_TOKEN']
    end
  end

  def fetch_user(user_name)
    begin
      HashWithIndifferentAccess.new(self.class.client.user(user_name).to_hash)
    rescue Twitter::Error::NotFound
      return {}
    end
  end

end
