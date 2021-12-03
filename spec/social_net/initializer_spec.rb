# frozen_string_literal: true

require "spec_helper"

RSpec.describe SocialNetsDB::SocialNet, ".new" do

  subject { described_class.new(uid, data) }

  context "valid input" do
    let(:uid) { "hohoho" }
    let(:data) do
      {
        "name"   => "Ho-ho-ho",
        "icons"  => { "font_awesome_4" => "ho-hoho" },
        "color"  => "#hoho",
        "domain" => "hohoho.xxx",
        "tags"   => ["hoho hoho"],
        "profile_url" => {
          "by_username"   => "https://${domain}/${uid}",
          "by_account_id" => "https://${domain}/${uid}"
        }
      }
    end

    it { is_expected.to be_a described_class }
    it { expect(subject.uid).to eq "hohoho" }
    it { expect(subject.name).to eq "Ho-ho-ho" }
    it { expect(subject.icons["font_awesome_4"]).to eq "ho-hoho" }
    it { expect(subject.color).to eq "#hoho" }
    it { expect(subject.domain).to eq "hohoho.xxx" }
    it { expect(subject.tags).to eq ["hoho hoho"] }
  end

end
