# frozen_string_literal: true

require "spec_helper"

RSpec.describe SocialNetsDB::SocialNet, ".all" do

  subject { described_class.all }

  it { is_expected.to be_a Array }
  it { expect(subject.all?(described_class)).to eq true }

end
