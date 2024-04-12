# frozen_string_literal: true

module Ryze
  # LeagueResource is a class corresponding to the LeagueV4 Riot API endpoint.
  class LeagueResource < Resource
    BASE_URL = "https://euw1.api.riotgames.com/lol/league/v4"

    # Retrieve the summoner's leagues by summoner ID.
    #
    # @param summoner_id [String] Summoner ID.
    # @return [Array<League>] League objects.
    def retrieve_leagues_by_summoner_id(summoner_id:)
      leagues = get_request("#{BASE_URL}/entries/by-summoner/#{summoner_id}").body
      leagues.map(&League.method(:new))
    end
  end
end
