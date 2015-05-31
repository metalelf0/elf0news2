require 'rails_helper'

describe Clients::StackExchange, :vcr do

  subject { described_class.new }

  context "Fetching an user" do

    specify "Get user by username" do
      user = subject.fetch_user('slg')
      expect(user['reputation']).to eql 8
    end

    specify "Get user by username - no such username" do
      user = subject.fetch_user('trtrtrtrtr')
      expect(user).to be_nil
    end

  end
end
