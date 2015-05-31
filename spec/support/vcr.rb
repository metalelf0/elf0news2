VCR.configure do |c|
  c.cassette_library_dir = 'spec/vcr'
  # Faraday 0.9 bug: https://github.com/vcr/vcr/issues/386
  c.hook_into :webmock
  c.configure_rspec_metadata!
  c.filter_sensitive_data('<TWITTER_SECRET>') do
    ENV['TWITTER_SECRET_KEY']
  end
  c.filter_sensitive_data('<TWITTER_CONSUMER>') do
    ENV['TWITTER_CONSUMER_KEY']
  end
end
