# frozen_string_literal: true

module Ryze
  # Summoner is a class corresponding to the SummonerDto Riot API object.
  class Summoner < Object
    def retrieve_last_match
      match_id = MatchResource.new(@client).retrieve_match_list_by_puuid(puuid: puuid, count: 1).first
      MatchResource.new(@client).retrieve_match(match_id: match_id)
    end
  end
end
