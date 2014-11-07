require 'webmock/rspec'
require 'vcr'
require_relative '../lib/seatgeek'
require_relative '../lib/seatgeek/events'
require_relative '../lib/seatgeek/venues'

WebMock.disable_net_connect!(allow_localhost: true)

VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  c.hook_into :webmock
  c.configure_rspec_metadata!
end

RSpec.configure do |config|
  config.include WebMock::API
end
