# frozen_string_literal: true

module Ryze
  # MatchResource is a class corresponding to the MatchV5 Riot API endpoint.
  class MatchResource < Resource
    BASE_URL = "https://europe.api.riotgames.com/lol/match/v5"

    # Retrieve a match by match ID.
    #
    # @param match_id [String] Match ID.
    # @return [Match] Match object.
    def retrieve_match(match_id:)
      Match.new get_request("#{BASE_URL}/matches/#{match_id}").body
    end

    # Retrieve a match list by account puuid.
    #
    # @param puuid [String] Account puuid.
    # @param params [Hash] Parameters to pass to the request.
    # @return [Array<String>] Match IDs.
    def retrieve_match_list_by_puuid(puuid:, **params)
      Array.new get_request("#{BASE_URL}/matches/by-puuid/#{puuid}/ids", params: params).body
    end
  end
end
