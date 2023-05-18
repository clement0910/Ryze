# frozen_string_literal: true

module Ryze
  # MatchResource is a class corresponding to the MatchV5 Riot API endpoint.
  class MatchResource < Resource
    def initialize(client)
      super
      @base_url = "https://europe.api.riotgames.com/lol/match/v5"
    end

    def retrieve_match(match_id:)
      Match.new get_request("/matches/#{match_id}").body
    end

    def retrieve_match_list_by_puuid(puuid:, **params)
      Array.new get_request("/matches/by-puuid/#{puuid}/ids", params: params).body
    end
  end
end
