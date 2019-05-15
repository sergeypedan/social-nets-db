# frozen_string_literal: true

require "spec_helper"

RSpec.describe Integral::SocialNet, ".new" do

  subject { described_class.new(social_net_uid) }

  context "with valid uid" do
    it do
      expect(described_class.new("facebook")).to be_a Integral::SocialNet
    end
  end

  context "with unsupported uid" do
    it do
      expect { described_class.new("blabla") }.to raise_exception ArgumentError
    end
  end

  context "with empty uid" do
    it do
      expect { described_class.new("") }.to raise_exception ArgumentError
    end
  end

  context "with no arguments" do
    it do
      expect { described_class.new }.to raise_exception ArgumentError
    end
  end

end
