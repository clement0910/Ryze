# frozen_string_literal: true

require "rspec"

RSpec.describe Ryze::Object do
  describe "#initialize" do
    subject { described_class.new(params) }

    shared_examples "object initialization" do |expected_result|
      it "should set the attributes" do
        expect(subject.foo).to eq(expected_result)
      end
    end

    context "with different types of params" do
      context "when params is a hash" do
        let(:params) { { foo: "bar" } }
        include_examples "object initialization", "bar"
      end

      context "when params is an array" do
        let(:params) { { foo: ["bar"] } }
        include_examples "object initialization", ["bar"]
      end

      context "when params is a nested hash" do
        let(:params) { { foo: { bar: "baz" } } }
        it "should set the nested attributes" do
          expect(subject.foo.bar).to eq "baz"
        end
      end

      context "when params is a nested hash number" do
        let(:params) { { foo: { bar: 1 } } }
        it "should set the nested attributes" do
          expect(subject.foo.bar).to eq 1
        end
      end
    end
  end
end
