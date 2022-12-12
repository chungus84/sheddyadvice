# -*- encoding: utf-8 -*-
# stub: swiper-rails 1.0.4 ruby lib

Gem::Specification.new do |s|
  s.name = "swiper-rails".freeze
  s.version = "1.0.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Nik Marchenko".freeze]
  s.date = "2016-07-27"
  s.description = "Swiper toolkit for Rails Asset Pipeline".freeze
  s.email = ["nik.marchenko@gmail.com".freeze]
  s.homepage = "https://github.com/nikmarchenko/swiper-rails".freeze
  s.rubygems_version = "3.3.18".freeze
  s.summary = "swiper-rails integrates Swiper toolkit for Rails Asset Pipeline".freeze

  s.installed_by_version = "3.3.18" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<rails>.freeze, [">= 3.1"])
  else
    s.add_dependency(%q<rails>.freeze, [">= 3.1"])
  end
end
