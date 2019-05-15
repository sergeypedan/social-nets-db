# frozen_string_literal: true

require "spec_helper"

RSpec.describe Integral::SocialNet, ".find_by(name: )" do

  subject { described_class.find_by(name: name) }

  context "by name" do
    context "correct name" do
      let(:name) { "Facebook" }
      it { is_expected.to be_a Integral::SocialNet }
      it "finds the correct social net" do expect( subject.uid ).to eq "facebook" end
    end

    context "incorrect name" do
      let(:name) { "bla" }
      it { is_expected.to be_nil }
    end

    context "empty string name" do
      let(:name) { "" }
      it "returns `nil`" do
        expect { described_class.find_by(name: name) }.to raise_exception ArgumentError
      end
    end

    context "nil name" do
      let(:name) { nil }
      it "returns `nil`" do
        expect { described_class.find_by(name: name) }.to raise_exception ArgumentError
      end
    end

  end

end
