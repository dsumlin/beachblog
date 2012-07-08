# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "path"
  s.version = "1.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Thomas Sawyer"]
  s.date = "2010-06-08"
  s.description = "Path is all about paths. It's provides a reimplementation of the Ruby standard Pathname library, Path::Name, a superior globbing facility, Path::List and an isolated shell-evironment, Path::Shell."
  s.extra_rdoc_files = ["README.rdoc"]
  s.files = ["README.rdoc"]
  s.homepage = "http://rubyworks.github.com/path"
  s.rdoc_options = ["--title", "Path API", "--main", "README.rdoc"]
  s.require_paths = ["lib", "vendor"]
  s.rubyforge_project = "path"
  s.rubygems_version = "1.8.24"
  s.summary = "Integrated set of a path-related libraries."

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
