# -*- encoding: utf-8 -*-
# stub: unsplash 2.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "unsplash".freeze
  s.version = "2.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Aaron Klaassen".freeze]
  s.bindir = "exe".freeze
  s.date = "2019-10-25"
  s.email = ["aaron@unsplash.com".freeze]
  s.homepage = "https://github.com/unsplash/unsplash_rb".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.3.0".freeze)
  s.rubygems_version = "3.3.18".freeze
  s.summary = "Ruby wrapper for the Unsplash API.".freeze

  s.installed_by_version = "3.3.18" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<httparty>.freeze, ["~> 0.16"])
    s.add_runtime_dependency(%q<oauth2>.freeze, ["~> 1"])
    s.add_development_dependency(%q<rake>.freeze, ["~> 12.3.2"])
    s.add_development_dependency(%q<rspec>.freeze, ["~> 3.8.0"])
    s.add_development_dependency(%q<vcr>.freeze, ["~> 3.0.0"])
    s.add_development_dependency(%q<webmock>.freeze, ["~> 3.5.1"])
    s.add_development_dependency(%q<pry>.freeze, [">= 0"])
    s.add_development_dependency(%q<coveralls>.freeze, [">= 0"])
    s.add_development_dependency(%q<dotenv>.freeze, [">= 0"])
    s.add_development_dependency(%q<rb-readline>.freeze, [">= 0"])
  else
    s.add_dependency(%q<httparty>.freeze, ["~> 0.16"])
    s.add_dependency(%q<oauth2>.freeze, ["~> 1"])
    s.add_dependency(%q<rake>.freeze, ["~> 12.3.2"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.8.0"])
    s.add_dependency(%q<vcr>.freeze, ["~> 3.0.0"])
    s.add_dependency(%q<webmock>.freeze, ["~> 3.5.1"])
    s.add_dependency(%q<pry>.freeze, [">= 0"])
    s.add_dependency(%q<coveralls>.freeze, [">= 0"])
    s.add_dependency(%q<dotenv>.freeze, [">= 0"])
    s.add_dependency(%q<rb-readline>.freeze, [">= 0"])
  end
end
