module Ryze
  class SummonerResource < Resource
    def get_summoner_by_name(summoner_name)
      Summoner.new get_request("https://euw1.api.riotgames.com/lol/summoner/v4/summoners/by-name/#{summoner_name}").body
    end
  end
end
