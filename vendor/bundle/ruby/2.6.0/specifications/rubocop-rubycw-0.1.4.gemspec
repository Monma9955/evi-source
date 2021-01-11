# -*- encoding: utf-8 -*-
# stub: rubocop-rubycw 0.1.4 ruby lib

Gem::Specification.new do |s|
  s.name = "rubocop-rubycw".freeze
  s.version = "0.1.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "homepage_uri" => "https://github.com/rubocop-hq/rubocop-rubycw", "source_code_uri" => "https://github.com/rubocop-hq/rubocop-rubycw" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Masataka Pocke Kuwabara".freeze]
  s.bindir = "exe".freeze
  s.date = "2020-01-02"
  s.description = "Integrate RuboCop and ruby -cw".freeze
  s.email = ["kuwabara@pocke.me".freeze]
  s.homepage = "https://github.com/rubocop-hq/rubocop-rubycw".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.3.0".freeze)
  s.rubygems_version = "3.0.3".freeze
  s.summary = "Integrate RuboCop and ruby -cw".freeze

  s.installed_by_version = "3.0.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rubocop>.freeze, [">= 0"])
    else
      s.add_dependency(%q<rubocop>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<rubocop>.freeze, [">= 0"])
  end
end
