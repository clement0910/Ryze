# frozen_string_literal: true

require "rspec"

RSpec.describe Ryze::SpectatorResource do
  let(:client) { Ryze::Client.new(api_key: "my_api_key", adapter: :test, stubs: faraday_stub) }
  let(:resource) { client.spectator }
  let(:base_url) { described_class::BASE_URL }

  describe "#retrieve_current_game_by_puuid" do
    subject(:request) { resource.retrieve_current_game_by_puuid(puuid: puuid) }

    let(:faraday_stub) do
      stub_request(url: "#{base_url}/active-games/by-summoner/#{puuid}", response: current_game_stub_response)
    end
    let(:current_game_stub_response) do
      stub_response(status: status_code, fixture: "spectator/retrieve_current_game_by_puuid_#{status_code}")
    end

    context "when summoner is in game" do
      let(:status_code) { 200 }
      let(:puuid) { "A8HnjCzPJgKsfXDp2AtEiXpe432OukTaWg_SI4WZRuyPcbA1vfviJd1U7JSoFjfJ5Wjy4HxPXV3LMQ" }

      it { is_expected.to be_a(Ryze::Spectator) }
    end

    context "when summoner is not in game" do
      let(:status_code) { 404 }
      let(:puuid) { "A8HnjCzPJgKsfXDp2AtEiXpe432OukTaWg_SI4WZRuyPcbA1vfviJd1U7JSoFjfJ5Wjy4HxPXV3LMQ" }

      it "raises an error" do
        expect { request }.to raise_error(Ryze::Error)
      end
    end

    context "when summoner is not found" do
      let(:status_code) { 400 }
      let(:puuid) { "invalid_puuid" }

      it "raises an error" do
        expect { request }.to raise_error(Ryze::Error)
      end
    end
  end
end
