# frozen_string_literal: true

require "addressable/uri"

module Ryze
  # Resource is a class that provides a base for all Riot API resources.
  class Resource
    attr_reader :client

    def initialize(client)
      @client = client
    end

    protected

    # Makes a GET request to the Riot API using the Faraday connection.
    #
    # @param url [String] The URL to make the request to.
    # @param params [Hash] The parameters to pass to the request.
    # @return [Faraday::Response] The response from the Riot API trailed by the Ryze response handler.
    def get_request(url, params: {})
      handle_response client.connection.get(Addressable::URI.encode(url), params)
    end

    private

    # Handles the response from the Riot API and raises an error if the response is not successful.
    #
    # @param response [Faraday::Response] The response from the Riot API.
    # @return [Faraday::Response] The response from the Riot API.
    def handle_response(response)
      if %w[400 401 403 404 405 415 429 500 502 503 504].include?(response.status.to_s)
        raise Error, "Riot API: #{response.body["status"]["message"]}"
      end

      response
    end
  end
end
