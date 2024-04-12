# frozen_string_literal: true

RSpec.describe Ryze::Client do
  describe "#initialize" do
    subject(:client) { described_class.new(api_key: "my_api_key") }

    it "set the api_key" do
      expect(client.api_key).to eq("my_api_key")
    end
  end
end
