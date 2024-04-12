# frozen_string_literal: true

module Ryze
  # SpectatorResource is a class corresponding to the SpectatorV5 Riot API endpoint.
  class SpectatorResource < Resource
    BASE_URL = "https://euw1.api.riotgames.com/lol/spectator/v5"

    # Retrieve a current game by summoner puuid.
    #
    # @param puuid [String] Summoner puuid.
    # @return [Spectator] Spectator object.
    def retrieve_current_game_by_puuid(puuid:)
      Spectator.new get_request("#{BASE_URL}/active-games/by-summoner/#{puuid}").body
    end
  end
end
