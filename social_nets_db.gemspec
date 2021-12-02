# frozen_string_literal: true

# https://guides.rubygems.org/name-your-gem/
# https://bundler.io/guides/creating_gem.html
# https://guides.rubyonrails.org/engines.html
# https://guides.rubyonrails.org/plugins.html

require_relative "lib/social_nets_db/version"

Gem::Specification.new do |spec|
  spec.name             = "social_nets_db"
  spec.version          = SocialNetsDB::VERSION
  spec.authors          = ["Sergey Pedan"]
  spec.email            = ["sergey.pedan@gmail.com"]
  spec.license          = "MIT"

  spec.summary          = "A non-comprehensive database of social nets packed in a Ruby gem"
  spec.description      = "#{spec.summary}. We have helpers for color, user page URL, FontAwesome icon, social net domain, some tags for grouping social nets, etc."

  spec.homepage         =  "https://sergeypedan.ru/open_source_projects/social-nets-db"
  spec.metadata         = { "changelog_uri"     => "https://github.com/sergeypedan/social-nets-db/blob/master/CHANGELOG.md",
                            "documentation_uri" => "https://www.rubydoc.info/gems/#{spec.name}",
                            "homepage_uri"      => spec.homepage,
                            "source_code_uri"   => "https://github.com/sergeypedan/social-nets-db" }

  spec.extra_rdoc_files = Dir["README*", "LICENSE*"]
  spec.rdoc_options     = ["--charset=UTF-8"]
  spec.bindir           = "exe"
  spec.executables      = []
  spec.require_paths    = ["lib"]
  spec.files            = Dir.chdir(File.expand_path(__dir__)) do
                            `git ls-files`.split("\n")
                              .reject { |f| %w[bin spec test].any? { |dir| f.start_with? dir } }
                              .reject { |f| f.start_with? "." }
                          end

  spec.required_ruby_version = Gem::Requirement.new(">= 2.4.0")

  spec.add_development_dependency "bundler", ">= 2", "< 3"
  spec.add_development_dependency "bundler-audit", ">= 0.9", "< 1"
  spec.add_development_dependency "pry", "< 1"
  spec.add_development_dependency "pry-byebug", "~> 3"
  spec.add_development_dependency "rake", "~> 13"
  spec.add_development_dependency "rspec", "~> 3"
  spec.add_development_dependency "rubocop", "~> 1"
end
