# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "susy"
  s.version = "1.0.alpha.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Eric Meyer"]
  s.date = "2012-05-12"
  s.description = "Responsive web design with grids the quick and reliable way."
  s.email = "eric@oddbird.net"
  s.extra_rdoc_files = ["CHANGELOG.mkdn", "LICENSE.txt", "README.mkdn", "lib/susy.rb"]
  s.files = ["CHANGELOG.mkdn", "LICENSE.txt", "README.mkdn", "lib/susy.rb"]
  s.homepage = "http://susy.oddbird.net/"
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Susy", "--main", "README.mkdn"]
  s.require_paths = ["lib"]
  s.rubyforge_project = "susy"
  s.rubygems_version = "1.8.24"
  s.summary = "A responsive grid system plugin for Compass."

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<compass>, [">= 0.12.2.rc.0"])
    else
      s.add_dependency(%q<compass>, [">= 0.12.2.rc.0"])
    end
  else
    s.add_dependency(%q<compass>, [">= 0.12.2.rc.0"])
  end
end
