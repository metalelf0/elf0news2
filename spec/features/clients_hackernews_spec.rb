require 'rails_helper'

describe Clients::HackerNews, :vcr do

  subject { described_class.new }

  context "Fetching top stories" do

    specify "Get 10 top stories" do
      top_stories = subject.top_stories(10)
      expect(top_stories.size).to eql 10
      expect(top_stories.first['by']).to eql 'JDDunn9'
    end

  end
end
