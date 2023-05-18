# frozen_string_literal: true

require "rspec"

RSpec.describe Ryze::Client do
  describe "#initialize" do
    subject { described_class.new(api_key: "my_api_key") }

    it "should set the api_key" do
      expect(subject.api_key).to eq "my_api_key"
    end
  end
end
