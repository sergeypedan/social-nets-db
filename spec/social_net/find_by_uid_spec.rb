# frozen_string_literal: true

require "spec_helper"

RSpec.describe SocialNetsDB::SocialNet, ".find_by_uid(uid)" do

  subject { described_class.find_by_uid(uid) }

  shared_examples "correctly finds record" do
    it { is_expected.to be_a described_class }
    it { expect(subject&.name).to eq "Facebook" }
    it { expect(subject&.uid).to eq "facebook" }
  end

  context "UID of invalid type" do
    context "nil UID" do
      let(:uid) { nil }
      it { expect { subject }.to raise_exception TypeError }
    end

    context "as Symbol" do
      let(:uid) { :facebook }
      it { expect { subject }.to raise_exception TypeError }
    end
  end

  context "UID of valid type" do
    context "empty String UID" do
      let(:uid) { "" }
      it { expect { subject }.to raise_exception ArgumentError }
    end

    context "existing UID" do
      context "as String" do
        let(:uid) { "facebook" }
        it_behaves_like "correctly finds record"
      end

    end

    context "unrecognized UID" do
      let(:uid) { "macebook" }
      it { is_expected.to be_nil }
    end
  end

end
