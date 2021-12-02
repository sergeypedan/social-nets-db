# frozen_string_literal: true

require "spec_helper"

RSpec.describe SocialNetsDB::SocialNet, ".find_by(name: )" do

  subject { described_class.find_by(name: name) }

  context "by name" do
    context "correct name" do
      let(:name) { "Facebook" }
      it { is_expected.to be_a described_class }
      it { expect( subject.uid ).to eq "facebook" }
    end

    context "incorrect name" do
      let(:name) { "bla" }
      it { is_expected.to be_nil }
    end

    context "empty string name" do
      let(:name) { "" }
      it { expect { described_class.find_by(name: name) }.to raise_exception ArgumentError }
    end

    context "nil name" do
      let(:name) { nil }
      it { expect { described_class.find_by(name: name) }.to raise_exception ArgumentError }
    end

  end

end
