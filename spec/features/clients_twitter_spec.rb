require 'rails_helper'

describe Clients::Twitter, :vcr do
  context "Fetching an user" do

    specify "Get user by username" do
      user = subject.fetch_user('dhh')
      expect(user.tweets_count).to eql 25457
    end
  end
end
