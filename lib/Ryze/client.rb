require 'faraday'

module Ryze
  class Client
    attr_reader :api_key, :adapter

    def initialize(api_key:, adapter: Faraday.default_adapter)
      @api_key = api_key
      @adapter = adapter
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
        conn.response :json, content_type: 'application/json'
        conn.adapter adapter
      end
    end

    def inspect
      "#<Ryze::Client>"
    end
  end
end