class Services::TopStories

  def self.hacker_news
    @@hacker_news_client ||= Clients::HackerNews.new
  end

  def self.stack_overflow
    @@stack_overflow_client ||= Clients::StackExchange.new
  end

  def self.twitter
    @@twitter_client ||= Clients::Twitter.new
  end

  def hacker_news
    self.class.hacker_news
  end

  def stack_overflow
    self.class.stack_overflow
  end

  def twitter
    self.class.twitter
  end

  def top_stories(limit=50)
    top_story_ids = hacker_news.fetch_top_story_ids(limit)
    data = [] 
    top_story_ids.each do |story_id|
      story_data = {}
      story_data['story'] = hacker_news.fetch_story(story_id)
      story_data['user'] = {}
      story_data['user']['hacker_news']  = hacker_news.fetch_user(story_data['story']['by'])
      story_data['user']['stack_overflow']  = stack_overflow.fetch_user(story_data['story']['by'])
      story_data['user']['twitter']  = twitter.fetch_user(story_data['story']['by'])
      data << story_data
    end
    return data
  end

end
