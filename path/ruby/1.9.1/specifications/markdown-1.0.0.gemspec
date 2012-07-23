# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "markdown"
  s.version = "1.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Gerald Bauer"]
  s.date = "2012-06-23"
  s.description = "Markdown Engine Wrapper - Use Your Markdown Library of Choice"
  s.email = "webslideshow@googlegroups.com"
  s.executables = ["markdown"]
  s.extra_rdoc_files = ["Manifest.txt"]
  s.files = ["bin/markdown", "Manifest.txt"]
  s.homepage = "http://geraldb.github.com/markdown"
  s.rdoc_options = ["--main", "README.markdown"]
  s.require_paths = ["lib"]
  s.rubyforge_project = "markdown"
  s.rubygems_version = "1.8.24"
  s.summary = "Markdown Engine Wrapper - Use Your Markdown Library of Choice"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<props>, [">= 1.0.0"])
      s.add_runtime_dependency(%q<textutils>, [">= 0.2.0"])
      s.add_runtime_dependency(%q<kramdown>, [">= 0.13.7"])
      s.add_development_dependency(%q<rdoc>, ["~> 3.10"])
      s.add_development_dependency(%q<hoe>, ["~> 3.0"])
    else
      s.add_dependency(%q<props>, [">= 1.0.0"])
      s.add_dependency(%q<textutils>, [">= 0.2.0"])
      s.add_dependency(%q<kramdown>, [">= 0.13.7"])
      s.add_dependency(%q<rdoc>, ["~> 3.10"])
      s.add_dependency(%q<hoe>, ["~> 3.0"])
    end
  else
    s.add_dependency(%q<props>, [">= 1.0.0"])
    s.add_dependency(%q<textutils>, [">= 0.2.0"])
    s.add_dependency(%q<kramdown>, [">= 0.13.7"])
    s.add_dependency(%q<rdoc>, ["~> 3.10"])
    s.add_dependency(%q<hoe>, ["~> 3.0"])
  end
end
