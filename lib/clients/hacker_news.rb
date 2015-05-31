class Clients::HackerNews

  BASE_URL         = 'https://hacker-news.firebaseio.com'
  TOP_STORIES_PATH = '/v0/topstories.json?print=pretty'

  def top_stories(limit=50)
    conn = Faraday.new(url: BASE_URL)
    response = conn.get TOP_STORIES_PATH
    top_story_ids = JSON.parse(response.body).take(limit)
    data = [] 
    top_story_ids.each do |story_id|
      data << fetch_story(story_id, conn)
    end
    return data
  end

  def fetch_story(story_id, connection=nil)
    connection ||= Faraday.new(url: base_url)
    response = connection.get(story_path(story_id))
    return JSON.parse(response.body)
  end

  private

  def story_path(story_id)
    "/v0/item/#{story_id}.json?print=pretty"
  end

end
