# frozen_string_literal: true

require "spec_helper"

RSpec.describe Integral::SocialNet, "#user_page" do

  subject { described_class.new("facebook").user_page(username: username, account_id: account_id) }

  let(:account_id) { nil }
  let(:username)   { nil }

  context "with only username passed" do
    let(:username) { "dhh" }
    it { is_expected.to eq "https://facebook.com/dhh" }
  end

  context "with only account_id passed" do
    let(:account_id) { "id12345" }
    it { is_expected.to eq "https://facebook.com/id12345" }
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
