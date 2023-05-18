module Ryze
  class Resource
    attr_reader :client

    def initialize(client)
      @client = client
    end

    def get_request(url, params: {}, headers: {})
      handle_response client.connection.get(@base_url + url, params, default_headers.merge(headers))
    end

    def default_headers
      { "X-Riot-Token" => client.api_key }
    end

    def handle_response(response)
      if %w[400 401 403 404 405 415 429 500 502 503 504].include?(response.status.to_s)
        raise Error, "Riot API: #{response.body["status"]["message"]}"
      end

      response
    end
  end
end
