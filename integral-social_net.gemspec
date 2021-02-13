# frozen_string_literal: true

lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "integral/social_net/version"

Gem::Specification.new do |spec|
  spec.name          = "integral-social_nets"
  spec.version       = Integral::SocialNet::VERSION
  spec.authors       = ["Sergey Pedan"]
  spec.email         = ["sergey.pedan@gmail.com"]
  spec.platform      = Gem::Platform::RUBY

  spec.summary       = "Non-comprehensive database of social nets with helpers (color, user page URL, FontAwesome icon etc.) packed in a Ruby gem."
  spec.description   = "Non-comprehensive database of social nets with helpers (color, user page URL, FontAwesome icon etc.) packed in a Ruby gem."
  spec.homepage      = "https://github.com/sergeypedan/integral-social-nets"
  spec.license       = "MIT"

  spec.metadata = {
    "changelog_uri"     => "https://github.com/sergeypedan/integral-social-nets/blob/master/CHANGELOG.md",
    "homepage_uri"      => spec.homepage,
    "source_code_uri"   => "https://github.com/sergeypedan/integral-social-nets.git"
  }

  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.files = Dir["lib/**/*"]
  spec.extra_rdoc_files = Dir["README*", "LICENSE*"]

  spec.add_development_dependency "bundler", ">= 2.0"
  spec.add_development_dependency "bundler-audit"
  spec.add_development_dependency "gemsmith"
  spec.add_development_dependency "git-cop"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "pry-byebug"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "reek"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rubocop"
  spec.add_development_dependency "rubocop-rspec"

end
