module Ryze
  class SummonerResource < Resource
    def initialize(client)
      super
      @base_url = "https://euw1.api.riotgames.com/lol/summoner/v4".freeze
    end

    def retrieve_summoner_by_name(summoner_name:)
      Summoner.new get_request("/summoners/by-name/#{summoner_name}").body, @client
    end

    def retrieve_summoner_by_puuid(puuid:)
      Summoner.new get_request("/summoners/by-puuid/#{puuid}").body, @client
    end

    def retrieve_summoner_by_account_id(account_id:)
      Summoner.new get_request("/summoners/by-account/#{account_id}").body, @client
    end

    def retrieve_summoner_by_summoner_id(summoner_id:)
      Summoner.new get_request("/summoners/#{summoner_id}").body, @client
    end
  end
end
