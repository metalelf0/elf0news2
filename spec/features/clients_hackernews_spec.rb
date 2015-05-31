require 'rails_helper'

describe Clients::HackerNews, :vcr do

  subject { described_class.new }

  context "Fetching top stories" do

    specify "Get 10 top story ids" do
      top_story_ids = subject.fetch_top_story_ids(10)
      expect(top_story_ids.size).to eql 10
      expect(top_story_ids.first).to eql 9632604
    end

  end
end
