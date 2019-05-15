# frozen_string_literal: true

require "spec_helper"

RSpec.describe Integral::SocialNet, "#fa_icon" do

  subject { described_class.new(social_net_uid) }

  let(:social_net_uid) { "facebook" }

  context "without arguments" do
    it do
      expect(subject.fa_icon).to eq "<span class=\"fa fa-facebook\" style=\"color: #3C5A99\"></span>"
    end
  end

  context "when `fa_id` is missing in the DB" do
    let(:social_net_uid) { "freelansim" }
    it "uses `link` font icon ID" do
      expect(subject.fa_icon).to eq "<span class=\"fa fa-link\" style=\"color: #4abfb4\"></span>"
    end
  end

  context "with `color: true`" do
    it do
      result = subject.fa_icon(color: true)
      expect(result).to eq "<span class=\"fa fa-facebook\" style=\"color: #3C5A99\"></span>"
    end
  end

  context "with `color: false`" do
    it do
      result = subject.fa_icon(color: false)
      expect(result).to eq "<span class=\"fa fa-facebook\"></span>"
    end
  end

  context "with `color: true` && style value" do
    context "style ends with ;" do
      it do
        result = subject.fa_icon(color: true, style: "margin-top: 10px;")
        expect(result).to eq "<span class=\"fa fa-facebook\" style=\"color: #3C5A99; margin-top: 10px;\"></span>"
      end
    end
    context "style ends without ;" do
      it do
        result = subject.fa_icon(color: true, style: "margin-top: 10px")
        expect(result).to eq "<span class=\"fa fa-facebook\" style=\"color: #3C5A99; margin-top: 10px;\"></span>"
      end
    end
  end

  context "with `color: true` && style value && class value" do
    it do
      result = subject.fa_icon(color: true, style: "margin-top: 10px;", class: "my-class")
      expect(result).to eq "<span class=\"fa fa-facebook my-class\" style=\"color: #3C5A99; margin-top: 10px;\"></span>"
    end
  end

end
