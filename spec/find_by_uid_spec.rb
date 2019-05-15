# frozen_string_literal: true

require "spec_helper"

RSpec.describe Integral::SocialNet, ".find_by(uid: )" do

  subject { described_class.find_by(uid: uid) }

  context "by UID" do
    context "correct UID" do
      let(:uid) { "facebook" }
      it { is_expected.to be_a Integral::SocialNet }
      it "finds the correct social net" do expect( subject.uid ).to eq uid end
    end

    context "incorrect UID" do
      let(:uid) { "bla" }
      it { is_expected.to be_nil }
    end

    context "empty string UID" do
      let(:uid) { "" }
      it "returns `nil`" do
        expect { subject }.to raise_exception ArgumentError
      end
    end

    context "nil UID" do
      let(:uid) { nil }
      it "returns `nil`" do
        expect { subject }.to raise_exception ArgumentError
      end
    end

  end

end
