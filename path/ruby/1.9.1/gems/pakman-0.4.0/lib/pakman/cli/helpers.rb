module Pakman

module ManifestHelper

  def installed_template_manifest_patterns
    # 1) search .    # that is, working/current dir
    # 2) search <config_dir>
    # 3) search <gem>/templates

    builtin_patterns = [
      "#{Pakman.root}/templates/*.txt"
    ]
    config_patterns  = [
      "#{File.expand_path(opts.config_path)}/*.txt",
      "#{File.expand_path(opts.config_path)}/*/*.txt"
    ]
    current_patterns = [
      "*.txt",
      "*/*.txt"
    ]
    
    patterns = []
    patterns += current_patterns
    patterns += config_patterns
    patterns += builtin_patterns
  end

  def installed_template_manifests
    excludes = [
      "Manifest.txt",
      "*/Manifest.txt"
    ]    
    
    Finder.new( logger ).find_manifests( installed_template_manifest_patterns, excludes )
  end

end # module ManifestHelper
end # module Pakman