module Ryze
  class MatchResource < Resource
    def get_match(match_id)
      Match.new get_request("https://europe.api.riotgames.com/lol/match/v5/matches/#{match_id}").body
    end

    def get_match_timeline(match_id)
      Match.new get_request("https://europe.api.riotgames.com/lol/match/v5/matches/#{match_id}/timeline").body
    end
  end
end
