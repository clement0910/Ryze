# frozen_string_literal: true

RSpec.describe Ryze::MatchResource do
  let(:client) { Ryze::Client.new(api_key: "my_api_key", adapter: :test, stubs: faraday_stub) }
  let(:resource) { client.match }
  let(:base_url) { described_class::BASE_URL }

  describe "#retrieve_match" do
    subject(:request) { resource.retrieve_match(match_id: match_id) }

    let(:faraday_stub) { stub_request(url: "#{base_url}/matches/#{match_id}", response: match_stub_response) }
    let(:match_stub_response) { stub_response(status: status_code, fixture: "match/retrieve_match_#{status_code}") }

    let(:match_id) { "EUW1_6396063557" }

    context "when response return 200 status code" do
      let(:status_code) { 200 }

      it { is_expected.to be_a(Ryze::Match) }

      it "return correct match_id" do
        expect(request.metadata.matchId).to eq(match_id)
      end
    end
  end

  describe "#retrieve_match_list_by_puuid" do
    subject(:request) { resource.retrieve_match_list_by_puuid(puuid: puuid, **params) }

    let(:faraday_stub) do
      stub_request(url: "#{base_url}/matches/by-puuid/#{puuid}/ids", response: match_stub_response)
    end
    let(:match_stub_response) { stub_response(fixture: "match/retrieve_match_list_by_puuid_200") }

    let(:puuid) { "A8HnjCzPJgKsfXDp2AtEiXpe432OukTaWg_SI4WZRuyPcbA1vfviJd1U7JSoFjfJ5Wjy4HxPXV3LMQ" }
    let(:params) { { count: 5 } }

    it { is_expected.to be_a(Array) }

    it "return count matches" do
      expect(request.count).to eq(params[:count])
    end

    it "is an array of Strings" do
      expect(request).to all(be_a(String))
    end
  end
end
