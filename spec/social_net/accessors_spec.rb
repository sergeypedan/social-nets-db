# frozen_string_literal: true

require "spec_helper"

RSpec.describe SocialNetsDB::SocialNet do

  subject { described_class.find("facebook") }

  describe "#color" do
    it { expect(subject.color).to eq "#3C5A99" }
  end

  describe "#icons" do
    it { expect(subject.icons["font_awesome_4"]).to eq "facebook" }
  end

  describe "#name" do
    it { expect(subject.name).to eq "Facebook" }
  end

  describe "#uid" do
    it { expect(subject.uid).to eq "facebook" }
  end

  describe "#domain" do
    it { expect(subject.domain).to eq "facebook.com" }
  end

  describe "#url" do
    it { expect(subject.url).to eq "https://facebook.com" }
  end

end
