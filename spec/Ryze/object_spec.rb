# frozen_string_literal: true

RSpec.describe Ryze::Object do
  describe "#initialize" do
    subject(:object) { described_class.new(params) }

    shared_examples "object initialization" do |expected_result|
      it "set the attributes" do
        expect(object.foo).to eq(expected_result)
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

        it "set the nested attributes" do
          expect(object.foo.bar).to eq "baz"
        end
      end

      context "when params is a nested hash number" do
        let(:params) { { foo: { bar: 1 } } }

        it "set the nested attributes" do
          expect(object.foo.bar).to eq 1
        end
      end
    end
  end
end
