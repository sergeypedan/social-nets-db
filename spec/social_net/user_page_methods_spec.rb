# frozen_string_literal: true

require "spec_helper"

RSpec.describe SocialNetsDB::SocialNet, "#user_page_methods" do

  subject { described_class.find(network_uid).user_page_methods }

  context "both methods exist" do
    let(:network_uid) { "facebook" }
    it { is_expected.to eq ["account_id", "username"] }
  end

  context "only :by_account_id exists" do
    let(:network_uid) { "upwork" }
    it { is_expected.to eq ["account_id"] }
  end

  context "only :by_username exists" do
    let(:network_uid) { "habr" }
    it { is_expected.to eq ["username"] }
  end

end
