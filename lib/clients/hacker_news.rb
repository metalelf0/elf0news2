class Clients::HackerNews

  attr_accessor :data

  BASE_URL         = 'https://hacker-news.firebaseio.com'
  TOP_STORIES_PATH = '/v0/topstories.json?print=pretty'

  def top_stories(limit=50)
    begin
      conn = Faraday.new(:url => BASE_URL)
      response = conn.get TOP_STORIES_PATH
      @data = JSON.parse(response.body).take(limit)
    rescue
      @data = {"items" => []}
    end
  end

end
