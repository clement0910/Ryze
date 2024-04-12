# frozen_string_literal: true

module Ryze
  # AccountResource is a class corresponding to the AccountV1 Riot API endpoint.
  class AccountResource < Resource
    BASE_URL = "https://europe.api.riotgames.com/riot/account/v1/accounts"

    # Retrieve an account by Riot ID.
    #
    # @param game_name [String] Game name of the account.
    # @param tag_line [String] Tag line of the account.
    # @return [Account] Account object.
    def retrieve_account_by_riot_id(game_name:, tag_line:)
      Account.new get_request("#{BASE_URL}/by-riot-id/#{game_name}/#{tag_line}").body
    end
  end
end
