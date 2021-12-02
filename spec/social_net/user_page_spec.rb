# frozen_string_literal: true

require "spec_helper"

RSpec.describe SocialNetsDB::SocialNet, "#user_page" do

  subject { described_class.find(social_net_uid).user_page(username: username, account_id: account_id) }

  let(:account_id) { nil }
  let(:username)   { nil }
  let(:social_net_uid) { "facebook" }

  context "with only username passed" do
    let(:username) { "dhh" }

    context "when by_username exists" do
      it { is_expected.to eq "https://facebook.com/dhh" }
    end

    context "when by_username missing" do
      let(:social_net_uid) { "discord" }
      it { is_expected.to be_nil }
    end
  end

  context "with only account_id passed" do
    let(:account_id) { "id12345" }

    context "when by_account_id exists" do
      it { is_expected.to eq "https://facebook.com/id12345" }
    end

    context "when by_account_id missing" do
      let(:social_net_uid) { "fl.ru" }
      it { is_expected.to be_nil }
    end

  end

  context "with neither username or account_id passed" do
    it do
      expect {
        described_class.new("facebook").user_page(username: username, account_id: account_id)
      }.to raise_exception ArgumentError
    end
  end

  context "with both username & account_id passed" do
    let(:account_id) { "id12345" }
    let(:username) { "dhh" }
    it { is_expected.to eq "https://facebook.com/dhh" }
  end

end
