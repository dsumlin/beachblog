module Pakman

class Copier

  attr_reader :logger
    
  def initialize( logger )
    @logger   = logger
  end

  def copy_pak( manifestsrc, pakpath )

    start = Time.now

    pakname = Pakman.pakname_from_file( manifestsrc )

    puts "Copying template pack '#{pakname}'"

    manifest = Manifest.load_file( logger, manifestsrc )

    manifest.each do |entry|
      dest   = entry[0]
      source = entry[1]

      # get full (absolute) path and make sure path exists
      destfull = File.expand_path( dest, pakpath )
      destpath = File.dirname( destfull )
      FileUtils.makedirs( destpath ) unless File.directory?( destpath )

      logger.debug "destfull=>#{destfull}<"
      logger.debug "destpath=>#{destpath}<"
      
      puts "  Copying to #{dest} from #{source}..."
      FileUtils.copy( source, destfull )
    end
    
    puts "Done (in #{Time.now-start} s)."
  end # method copy_pak

end # class Copier
end # module Pakman