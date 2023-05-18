module Ryze
  class MatchResource < Resource
    def initialize(client)
      super
      @base_url = "https://europe.api.riotgames.com/lol/match/v5".freeze
    end

    def retrieve_match(match_id:)
      Match.new get_request("/matches/#{match_id}").body
    end

    def retrieve_match_timeline(match_id:)
      Match.new get_request("/matches/#{match_id}/timeline").body
    end

    def retrieve_matchlist_by_puuid(puuid:, **params)
      Array.new get_request("/matches/by-puuid/#{puuid}/ids", params: params).body
    end
  end
end
