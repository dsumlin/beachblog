# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "fetcher"
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Gerald Bauer"]
  s.date = "2012-06-03"
  s.description = "fetcher - Fetch Text Documents or Binary Blobs via HTTP, HTTPS"
  s.email = "webslideshow@googlegroups.com"
  s.executables = ["fetch"]
  s.extra_rdoc_files = ["Manifest.txt"]
  s.files = ["bin/fetch", "Manifest.txt"]
  s.homepage = "http://geraldb.github.com/fetcher"
  s.rdoc_options = ["--main", "README.markdown"]
  s.require_paths = ["lib"]
  s.rubyforge_project = "fetcher"
  s.rubygems_version = "1.8.24"
  s.summary = "fetcher - Fetch Text Documents or Binary Blobs via HTTP, HTTPS"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rdoc>, ["~> 3.10"])
      s.add_development_dependency(%q<hoe>, ["~> 3.0"])
    else
      s.add_dependency(%q<rdoc>, ["~> 3.10"])
      s.add_dependency(%q<hoe>, ["~> 3.0"])
    end
  else
    s.add_dependency(%q<rdoc>, ["~> 3.10"])
    s.add_dependency(%q<hoe>, ["~> 3.0"])
  end
end
