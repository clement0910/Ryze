# frozen_string_literal: true

require "Ryze"
require "faraday"
require "json"

module TestHelpers
  def stub_response(fixture:, status: 200, headers: { "Content-Type" => "application/json" })
    [status, headers, File.read("spec/fixtures/#{fixture}.json")]
  end

  def stub_request(url:, response:)
    Faraday::Adapter::Test::Stubs.new do |stub|
      stub.get(url) { response }
    end
  end
end

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.include TestHelpers
end
