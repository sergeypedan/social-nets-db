# frozen_string_literal: true

require "spec_helper"

RSpec.describe Integral::SocialNet, "#fa_icon" do

  subject { described_class.new("facebook") }

  context "without arguments" do
    it do
      expect(subject.fa_icon).to eq "<span class=\"fa fa-facebook\" style=\"color: #3C5A99\"></span>"
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

end
