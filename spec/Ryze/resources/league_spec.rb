# frozen_string_literal: true

RSpec.describe Ryze::LeagueResource do
  let(:client) { Ryze::Client.new(api_key: "my_api_key", adapter: :test, stubs: faraday_stub) }
  let(:resource) { client.league }
  let(:base_url) { described_class::BASE_URL }

  describe "#retrieve_leagues_by_summoner_id" do
    subject(:request) { resource.retrieve_leagues_by_summoner_id(summoner_id: summoner_id) }

    let(:faraday_stub) do
      stub_request(url: "#{base_url}/entries/by-summoner/#{summoner_id}", response: league_stub_response)
    end
    let(:league_stub_response) do
      stub_response(status: status_code, fixture: "league/retrieve_leagues_by_summoner_id_#{status_code}")
    end

    let(:summoner_id) { "WQFHFqt78r-7qp2JwTLTXTp7Vh2aymN6cHnho9YyNDzJ5b4" }

    context "when response return 200 status code" do
      let(:status_code) { 200 }

      it { is_expected.to be_a(Array) }

      it "is an array of League objects" do
        expect(request).to all(be_a(Ryze::League))
      end

      it "return correct summoner_id" do
        expect(request.first.summonerId).to eq(summoner_id)
      end
    end
  end
end
