require 'rails_helper'

describe Clients::HackerNews, :vcr do

  subject { described_class.new }

  context "Fetching top stories" do

    # TODO: move this to another class
    specify "Get 10 top stories with user data" do
      top_stories = subject.top_stories(10)
      expect(top_stories.size).to eql 10
      expect(top_stories.first['story']['by']).to eql 'slg'
      expect(top_stories.first['user']['karma']).to eql 2286
    end

    specify "Get 10 top story ids" do
      top_story_ids = subject.fetch_top_story_ids(10)
      expect(top_story_ids.size).to eql 10
      expect(top_story_ids.first).to eql 9632604
    end

  end
end
