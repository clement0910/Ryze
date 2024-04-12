# frozen_string_literal: true

module Ryze
  # SummonerResource is a class corresponding to the SummonerV4 Riot API endpoint.
  class SummonerResource < Resource
    BASE_URL = "https://euw1.api.riotgames.com/lol/summoner/v4"

    # Retrieve a summoner by summoner puuid.
    #
    # @param puuid [String] Summoner puuid.
    # @return [Summoner] Summoner object.
    def retrieve_summoner_by_puuid(puuid:)
      Summoner.new get_request("#{BASE_URL}/summoners/by-puuid/#{puuid}").body
    end

    # Retrieve a summoner by summoner account ID.
    #
    # @param account_id [String] Summoner account ID.
    # @return [Summoner] Summoner object.
    def retrieve_summoner_by_account_id(account_id:)
      Summoner.new get_request("#{BASE_URL}/summoners/by-account/#{account_id}").body
    end

    # Retrieve a summoner by summoner ID.
    #
    # @param summoner_id [String] Summoner ID.
    # @return [Summoner] Summoner object.
    def retrieve_summoner_by_summoner_id(summoner_id:)
      Summoner.new get_request("#{BASE_URL}/summoners/#{summoner_id}").body
    end
  end
end
