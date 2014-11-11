require 'webmock/rspec'
require 'vcr'
require_relative '../lib/seatgeeker'
require_relative '../lib/seatgeeker/events'
require_relative '../lib/seatgeeker/venues'

WebMock.disable_net_connect!(allow_localhost: true)

VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  c.hook_into :webmock
  c.configure_rspec_metadata!
end

RSpec.configure do |config|
  config.include WebMock::API
end
