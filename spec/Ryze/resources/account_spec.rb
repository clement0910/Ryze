# frozen_string_literal: true

RSpec.describe Ryze::AccountResource do
  let(:client) { Ryze::Client.new(api_key: "my_api_key", adapter: :test, stubs: faraday_stub) }
  let(:resource) { client.account }
  let(:base_url) { described_class::BASE_URL }

  describe "#retrieve_account_by_riot_id" do
    subject(:request) { resource.retrieve_account_by_riot_id(game_name: game_name) }

    let(:game_name) { "ReSPioZ" }
    let(:faraday_stub) do
      stub_request(url: "#{base_url}/by-riot-id/#{game_name}/EUW",
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

  describe "#retrieve_account_by_puuid" do
    subject(:request) { resource.retrieve_account_by_puuid(puuid: puuid) }

    let(:puuid) { "CprZJ5kCP_la_kH6jIz2Wxt9j370YcJLumJIyvxxL-CAvzcJqsPzZlz8MNRGFwXALdXQM2mN2Opy1w" }
    let(:faraday_stub) do
      stub_request(url: "#{base_url}/by-puuid/#{puuid}",
                   response: account_stub_response)
    end
    let(:account_stub_response) do
      stub_response(status: status_code, fixture: "account/retrieve_account_#{status_code}")
    end

    context "when account is found" do
      let(:status_code) { 200 }

      it { is_expected.to be_a(Ryze::Account) }

      it "have correct puuid" do
        expect(request.puuid).to eq(puuid)
      end
    end

    context "when account is not found" do
      let(:status_code) { 400 }

      it "raise an error" do
        expect { request }.to raise_error(Ryze::Error)
      end
    end
  end
end
