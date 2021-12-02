# frozen_string_literal: true

require "spec_helper"

RSpec.describe TagHelper, ".tag_attributes_to_s" do

  include TagHelper

  subject { tag_attributes_to_s(argument) }

  context "with illegal input" do

    context "when no arguments passed" do
      it "raises exception" do
        expect { tag_attributes_to_s() }.to raise_exception ArgumentError
      end
    end

    context "when passed an Integer" do
      let(:argument) { 1 }
      it "raises exception" do
        expect { subject }.to raise_exception ArgumentError
      end
    end

    context "when passed a nil" do
      let(:argument) { nil }
      it "raises exception" do
        expect { subject }.to raise_exception ArgumentError
      end
    end

    context "when passed an Array" do
      let(:argument) { [1, 2, 3] }
      it "raises exception" do
        expect { subject }.to raise_exception ArgumentError
      end
    end

    context "when passed a class" do
      let(:argument) { RSpec }
      it "raises exception" do
        expect { subject }.to raise_exception ArgumentError
      end
    end

    context "when passed a Range" do
      let(:argument) { 1..3 }
      it "raises exception" do
        expect { subject }.to raise_exception ArgumentError
      end
    end

  end


  context "when passed an empty Hash" do
    let(:argument) { {} }
    it { is_expected.to eq "" }
  end

  context "when passed a Hash" do

    context "with a single attribute pair" do

      context "with single nil value" do
        let(:argument) { { class: nil } }
        it { is_expected.to eq "" }
      end

      context "with single String value" do
        let(:argument) { { class: "my-class" } }
        it { is_expected.to eq "class=\"my-class\"" }
      end

      context "with Array value with one item" do
        let(:argument) { { class: ["my-class"] } }
        it { is_expected.to eq "class=\"my-class\"" }
      end

      context "with Array value with many items" do
        let(:argument) { { class: ["my-class", "other-class"] } }
        it { is_expected.to eq "class=\"my-class other-class\"" }
      end

    end

    context "with many attribute pairs" do

      context "both attributes having values" do
        let(:argument) { { class: ["my-class", "other-class"], style: "color: white" } }
        it { is_expected.to eq "class=\"my-class other-class\" style=\"color: white\"" }
      end

      context "both attributes with empty values" do
        let(:argument) { { class: [], style: "" } }
        it { is_expected.to eq "" }
      end

      context "last attribute has no value" do
        let(:argument) { { class: ["my-class", "other-class"], style: "" } }
        it { is_expected.to eq "class=\"my-class other-class\"" }
      end

    end

  end

end
