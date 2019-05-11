# frozen_string_literal: true

require "spec_helper"

RSpec.describe Integral::SocialNet, ".present_str?" do

  subject { Integral::SocialNet.present_str?(arg) }

  context "when no argument" do
    it do
      expect { described_class.present_str?() }.to raise_exception ArgumentError
    end
  end

  context "with nil" do
    let(:arg) { nil }
    it { is_expected.to be_falsey }
  end

  context "with an empty string" do
    let(:arg) { "" }
    it { is_expected.to be_falsey }
  end

  context "with an Integer" do
    let(:arg) { 5 }
    it { is_expected.to be_falsey }
  end

  context "with a string" do
    let(:arg) { "facebook" }
    it { is_expected.to be_truthy }
  end

end
