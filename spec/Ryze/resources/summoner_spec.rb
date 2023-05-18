# frozen_string_literal: true

require "rspec"
require "spec_helper"

RSpec.describe Ryze::SummonerResource do
  let(:client) { Ryze::Client.new(api_key: "my_api_key", adapter: :test, stubs: faraday_stub) }
  let(:resource) { client.summoner }
  let(:base_url) { "https://euw1.api.riotgames.com/lol/summoner/v4" }

  shared_examples "retrieve_summoner" do |method, url, identifier_key, identifier_method, identifier|
    let(:faraday_stub) { stub_request(url: "#{base_url}/#{url}/#{identifier}", response: summoner_stub_response) }
    let(:summoner_stub_response) { stub_response(fixture: "summoner/retrieve_summoner") }

    subject { resource.send(method, identifier_key => identifier) }

    it "should return a Summoner Class" do
      expect(subject).to be_a(Ryze::Summoner)
    end

    it "should have correct identifier" do
      expect(subject.send(identifier_method)).to eq(identifier)
    end
  end

  describe "#retrieve_summoner_by_name" do
    it_behaves_like "retrieve_summoner",
                    :retrieve_summoner_by_name,
                    "summoners/by-name",
                    :summoner_name,
                    :name,
                    "ReSPioZ"
  end

  describe "#retrieve_summoner_by_puuid" do
    it_behaves_like "retrieve_summoner",
                    :retrieve_summoner_by_puuid,
                    "summoners/by-puuid",
                    :puuid,
                    :puuid,
                    "A8HnjCzPJgKsfXDp2AtEiXpe432OukTaWg_SI4WZRuyPcbA1vfviJd1U7JSoFjfJ5Wjy4HxPXV3LMQ"
  end

  describe "#retrieve_summoner_by_account_id" do
    it_behaves_like "retrieve_summoner",
                    :retrieve_summoner_by_account_id,
                    "summoners/by-account",
                    :account_id,
                    :accountId,
                    "cMBZDmzRxIXzKuJgu0GLd5R37WVjcwD3FsKkZNmRyxnAIwM"
  end

  describe "#retrieve_summoner_by_summoner_id" do
    it_behaves_like "retrieve_summoner",
                    :retrieve_summoner_by_summoner_id,
                    "summoners",
                    :summoner_id,
                    :id,
                    "WQFHFqt78r-7qp2JwTLTXTp7Vh2aymN6cHnho9YyNDzJ5b4"
  end
end
