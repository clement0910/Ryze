# frozen_string_literal: true

require "rspec"
require "spec_helper"

RSpec.describe Ryze::MatchResource do
  let(:client) { Ryze::Client.new(api_key: "my_api_key", adapter: :test, stubs: faraday_stub) }
  let(:resource) { client.match }
  let(:base_url) { "https://europe.api.riotgames.com/lol/match/v5" }

  describe "#retrieve_match" do
    subject { resource.retrieve_match(match_id: match_id) }
    let(:faraday_stub) { stub_request(url: "#{base_url}/matches/#{match_id}", response: match_stub_response) }
    let(:match_stub_response) { stub_response(status: status_code, fixture: "match/retrieve_match_#{status_code}") }

    let(:match_id) { "EUW1_6396063557" }

    context "when response return 200 status code" do
      let(:status_code) { 200 }

      it "should return a Match Class" do
        expect(subject).to be_a(Ryze::Match)
      end

      it "should return correct match_id" do
        expect(subject.metadata.matchId).to eq(match_id)
      end
    end

    context "when response return 403 status code" do
      let(:status_code) { 403 }

      it "should raise an error" do
        expect { subject }.to raise_error(Ryze::Error, "Riot API: Forbidden")
      end
    end
  end

  describe "#retrieve_match_list_by_puuid" do
    subject { resource.retrieve_match_list_by_puuid(puuid: puuid, **params) }
    let(:faraday_stub) do
      stub_request(url: "#{base_url}/matches/by-puuid/#{puuid}/ids", response: match_stub_response)
    end
    let(:match_stub_response) { stub_response(fixture: "match/retrieve_match_list_by_puuid") }

    let(:puuid) { "A8HnjCzPJgKsfXDp2AtEiXpe432OukTaWg_SI4WZRuyPcbA1vfviJd1U7JSoFjfJ5Wjy4HxPXV3LMQ" }
    let(:params) { { count: 5 } }

    it "should return an Array" do
      expect(subject).to be_a(Array)
    end

    it "should return count matches" do
      expect(subject.count).to eq(params[:count])
    end

    it "should be an array of Strings" do
      expect(subject).to all(be_a(String))
    end
  end
end
