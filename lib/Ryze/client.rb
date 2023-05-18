# frozen_string_literal: true

require "faraday"

module Ryze
  # Client is the main entry point for interacting with the Riot API.
  class Client
    attr_reader :api_key, :adapter

    def initialize(api_key:, adapter: Faraday.default_adapter, stubs: nil)
      @api_key = api_key
      @adapter = adapter
      @stubs = stubs
    end

    def summoner
      SummonerResource.new(self)
    end

    def match
      MatchResource.new(self)
    end

    def connection
      @connection ||= Faraday.new do |conn|
        conn.request :json
        conn.response :json, content_type: "application/json"
        conn.adapter adapter, @stubs
      end
    end
  end
end
