# frozen_string_literal: true

require "spec_helper"

RSpec.describe Integral::SocialNet do

  subject { described_class.new("facebook") }

  describe "#color" do
    it do expect(subject.color).to eq "#3b5998" end
  end

  describe "#fa_id" do
    it do expect(subject.fa_id).to eq "facebook" end
  end

  describe "#name" do
    it do expect(subject.name).to eq "Facebook" end
  end

  describe "#uid" do
    it do expect(subject.uid).to eq "facebook" end
  end

  describe "#url" do
    it do expect(subject.url).to eq "https://facebook.com" end
  end

end
