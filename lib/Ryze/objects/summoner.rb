module Ryze
  class Summoner < Object
    def retrieve_last_match_info
      match_id = MatchResource.new(@client).retrieve_matchlist_by_puuid(puuid: puuid).first
      MatchResource.new(@client).retrieve_match(match_id: match_id)
    end
  end
end
