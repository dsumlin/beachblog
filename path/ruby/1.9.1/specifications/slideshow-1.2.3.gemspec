# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "slideshow"
  s.version = "1.2.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Gerald Bauer"]
  s.date = "2012-06-24"
  s.description = "The Slide Show (S9) Ruby gem lets you create slide shows and author slides in plain text\nusing a wiki-style markup language that's easy-to-write and easy-to-read.\nThe Slide Show (S9) project also collects and welcomes themes and ships\n\"out-of-the-gem\" with built-in support for \"loss-free\" gradient vector graphics themes."
  s.email = "webslideshow@googlegroups.com"
  s.executables = ["slideshow"]
  s.extra_rdoc_files = ["Manifest.txt", "templates/s6.txt"]
  s.files = ["bin/slideshow", "Manifest.txt", "templates/s6.txt"]
  s.homepage = "http://slideshow.rubyforge.org"
  s.post_install_message = "******************************************************************************\n\nQuestions? Comments? Send them along to the mailing list.\nhttps://groups.google.com/group/webslideshow\n\n******************************************************************************\n"
  s.rdoc_options = ["--main", "README.markdown"]
  s.require_paths = ["lib"]
  s.rubyforge_project = "slideshow"
  s.rubygems_version = "1.8.24"
  s.summary = "Slide Show (S9) - A Free Web Alternative to PowerPoint and KeyNote in Ruby"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<props>, [">= 1.0.0"])
      s.add_runtime_dependency(%q<markdown>, [">= 1.0.0"])
      s.add_runtime_dependency(%q<textutils>, [">= 0.2.0"])
      s.add_runtime_dependency(%q<pakman>, [">= 0.4.0"])
      s.add_runtime_dependency(%q<activesupport>, [">= 3.2.6"])
      s.add_runtime_dependency(%q<RedCloth>, [">= 4.2.9"])
      s.add_development_dependency(%q<rdoc>, ["~> 3.10"])
      s.add_development_dependency(%q<hoe>, ["~> 3.0"])
    else
      s.add_dependency(%q<props>, [">= 1.0.0"])
      s.add_dependency(%q<markdown>, [">= 1.0.0"])
      s.add_dependency(%q<textutils>, [">= 0.2.0"])
      s.add_dependency(%q<pakman>, [">= 0.4.0"])
      s.add_dependency(%q<activesupport>, [">= 3.2.6"])
      s.add_dependency(%q<RedCloth>, [">= 4.2.9"])
      s.add_dependency(%q<rdoc>, ["~> 3.10"])
      s.add_dependency(%q<hoe>, ["~> 3.0"])
    end
  else
    s.add_dependency(%q<props>, [">= 1.0.0"])
    s.add_dependency(%q<markdown>, [">= 1.0.0"])
    s.add_dependency(%q<textutils>, [">= 0.2.0"])
    s.add_dependency(%q<pakman>, [">= 0.4.0"])
    s.add_dependency(%q<activesupport>, [">= 3.2.6"])
    s.add_dependency(%q<RedCloth>, [">= 4.2.9"])
    s.add_dependency(%q<rdoc>, ["~> 3.10"])
    s.add_dependency(%q<hoe>, ["~> 3.0"])
  end
end
