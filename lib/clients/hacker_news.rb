class Clients::HackerNews

  BASE_URL         = 'https://hacker-news.firebaseio.com'
  TOP_STORIES_PATH = '/v0/topstories.json?print=pretty'

  def top_stories(limit=50)
    begin
      conn = Faraday.new(:url => BASE_URL)
      response = conn.get TOP_STORIES_PATH
      ids = JSON.parse(response.body).take(limit)
      data = [] 
      ids.each do |id|
        data << JSON.parse(conn.get(story_path(id)).body)
      end
      return data
    rescue
      return [] 
    end
  end

  private

  def story_path(story_id)
    "/v0/item/#{story_id}.json?print=pretty"
  end

end
