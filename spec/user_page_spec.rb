# frozen_string_literal: true

require "spec_helper"

RSpec.describe Integral::SocialNet, "#user_page" do

  subject { described_class.new("facebook").user_page(username: username, account_id: account_id) }

  let(:username)   { nil }
  let(:account_id) { nil }

  context "with only username" do
    let(:username) { "dhh" }
    it { is_expected.to eq "https://facebook.com/dhh" }
  end

  context "with only account_id" do
    let(:account_id) { "id12345" }
    it { is_expected.to eq "https://facebook.com/id12345" }
  end

  context "with neither username or account_id" do
    it do
      expect {
        described_class.new("facebook").user_page(username: username, account_id: account_id)
      }.to raise_exception ArgumentError
    end
  end

end
