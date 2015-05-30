VCR.configure do |c|
  c.cassette_library_dir = 'spec/vcr'
  # Faraday 0.9 bug: https://github.com/vcr/vcr/issues/386
  c.hook_into :webmock
  c.configure_rspec_metadata!
end
