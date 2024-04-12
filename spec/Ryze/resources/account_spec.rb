# frozen_string_literal: true

RSpec.describe Ryze::AccountResource do
  let(:client) { Ryze::Client.new(api_key: "my_api_key", adapter: :test, stubs: faraday_stub) }
  let(:resource) { client.account }

  describe "#retrieve_account_by_riot_id" do
    subject(:request) { resource.retrieve_account_by_riot_id(game_name: game_name, tag_line: tag_line) }

    let(:game_name) { "ReSPioZ" }
    let(:tag_line) { "EUW" }
    let(:faraday_stub) do
      stub_request(url: "https://europe.api.riotgames.com/riot/account/v1/accounts/by-riot-id/#{game_name}/#{tag_line}",
                   response: account_stub_response)
    end
    let(:account_stub_response) do
      stub_response(status: status_code, fixture: "account/retrieve_account_#{status_code}")
    end

    context "when account is found" do
      let(:status_code) { 200 }

      it { is_expected.to be_a(Ryze::Account) }

      it "have correct game_name" do
        expect(request.gameName).to eq(game_name)
      end
    end

    context "when account is not found" do
      let(:status_code) { 404 }

      it "raise an error" do
        expect { request }.to raise_error(Ryze::Error)
      end
    end
  end
end
