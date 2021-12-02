# frozen_string_literal: true

require "spec_helper"

RSpec.describe SocialNetsDB::SocialNet do

  describe "#uids" do
    subject { described_class.uids }
    it { is_expected.to be_a Array }
    it { expect(subject.select { _1 == "" }).to be_empty }
    it { expect(subject.select { _1.nil? }).to be_empty }
    it { expect(subject.all?(String)).to eq true }
    it { expect(subject.size).to eq subject.uniq.size }
  end

  describe "#names" do
    subject { described_class.names }
    it { is_expected.to be_a Array }
    it { expect(subject.select { _1 == "" }).to be_empty }
    it { expect(subject.select { _1.nil? }).to be_empty }
    it { expect(subject.all?(String)).to eq true }
    it { expect(subject.size).to eq subject.uniq.size }
  end

end
