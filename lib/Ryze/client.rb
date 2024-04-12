# frozen_string_literal: true

require "faraday"

module Ryze
  # Client is the main entry point for interacting with the Riot API.
  class Client
    attr_reader :api_key, :adapter

    # @param api_key [String] Your Riot API key.
    # @param adapter [Symbol] Faraday adapter.
    # @param stubs [Faraday::Adapter::Test::Stubs] Faraday stubs.
    # @return [Client] A new instance of Client.
    def initialize(api_key:, adapter: Faraday.default_adapter, stubs: nil)
      @api_key = api_key
      @adapter = adapter
      @stubs = stubs
    end

    # @return [SummonerResource] A new instance of SummonerResource.
    def summoner
      SummonerResource.new(self)
    end

    # @return [MatchResource] A new instance of MatchResource.
    def match
      MatchResource.new(self)
    end

    # @return [AccountResource] A new instance of AccountResource.
    def account
      AccountResource.new(self)
    end

    # @return [SpectatorResource] A new instance of SpectatorResource.
    def spectator
      SpectatorResource.new(self)
    end

    # @return [Faraday::Connection] A new instance of Faraday::Connection or the current instance.
    def connection
      @connection ||= Faraday.new do |conn|
        conn.headers["X-Riot-Token"] = @api_key
        conn.response :json, content_type: "application/json"
        conn.adapter adapter, @stubs
      end
    end
  end
end
