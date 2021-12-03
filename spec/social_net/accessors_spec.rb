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

  describe "#tags" do
    let(:data) do
      {
        "name"   => "Facebook",
        "icons"  => { "font_awesome_4" => "facebook" },
        "color"  => "#3C5A99",
        "domain" => "facebook.com",
        "tags"   => tags,
        "profile_url" => {
          "by_username"   => "https://${domain}/${uid}",
          "by_account_id" => "https://${domain}/${uid}"
        }
      }
    end

    context "when a social net has no tags" do
      subject(:net) { SocialNetsDB::SocialNet.new("hohoho", data) }
      let(:tags) { [] }
      it { expect(subject.tags).to eq tags }
    end

    context "when a social net has 1 tag" do
      subject(:net) { SocialNetsDB::SocialNet.new("hohoho", data) }
      let(:tags) { ["one"] }
      it { expect(subject.tags).to eq tags }
    end

    context "when a social net has many tags" do
      subject(:net) { SocialNetsDB::SocialNet.new("hohoho", data) }
      let(:tags) { ["one", "two"] }
      it { expect(subject.tags).to eq tags }
    end
  end

end
