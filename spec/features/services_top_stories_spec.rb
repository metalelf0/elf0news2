require 'rails_helper'

describe Services::TopStories, :vcr do

  subject { described_class.new }

  context "Fetching 10 top stories with user data from different services" do

    specify "Get 10 top stories with user data" do
      top_stories = subject.top_stories(10)
      expect(top_stories.size).to eql 10
      expect(top_stories.first['story']['by']).to eql 'slg'
      expect(top_stories.first['user']['hacker_news']['karma']).to eql 2322
      expect(top_stories.first['user']['stack_overflow']['reputation']).to eql 8
      expect(top_stories.first['user']['twitter']['statuses_count']).to eql 0
    end

  end
end

