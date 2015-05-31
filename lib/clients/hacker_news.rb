class Clients::HackerNews

  BASE_URL         = 'https://hacker-news.firebaseio.com'
  TOP_STORIES_PATH = '/v0/topstories.json?print=pretty'

  def self.connection
    @@connection ||= Faraday.new(url: BASE_URL)
  end

  def fetch_top_story_ids(limit=50)
    response = self.class.connection.get(TOP_STORIES_PATH)
    return JSON.parse(response.body).take(limit)
  end

  def fetch_story(story_id)
    response = self.class.connection.get(story_path(story_id))
    return JSON.parse(response.body)
  end

  def fetch_user(user_id)
    response = self.class.connection.get(user_path(user_id))
    return JSON.parse(response.body)
  end

  private

  def story_path(story_id)
    "/v0/item/#{story_id}.json?print=pretty"
  end

  def user_path(user_id)
    "/v0/user/#{user_id}.json?print=pretty"
  end

end
