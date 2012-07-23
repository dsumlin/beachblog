module Pakman

class Templater

  attr_reader :logger
    
  def initialize( logger )
    @logger   = logger
  end


  def merge_pak( manifestsrc, pakpath, binding, name )
  
    start = Time.now
    
    pakname = Pakman.pakname_from_file( manifestsrc )

    puts "Merging template pack '#{pakname}'"

    manifest = Manifest.load_file( logger, manifestsrc )

    manifest.each do |entry|
      dest   = entry[0]
      source = entry[1]
      
      if dest =~ /__file__/   # replace w/ name
        dest = dest.gsub( '__file__', name )
      end
      
      # get full (absolute) path and make sure path exists
      destfull = File.expand_path( dest, pakpath )
      destpath = File.dirname( destfull )
      FileUtils.makedirs( destpath ) unless File.directory?( destpath )

      logger.debug "destfull=>#{destfull}<"
      logger.debug "destpath=>#{destpath}<"
   
      if source =~ /\.erb\.|.erb$/
        puts "  Merging to #{dest}..."

        out = File.new( destfull, 'w+' )
        out << Template.new( source ).render( binding )
        out.flush
        out.close
      else
        puts "  Copying to #{dest} from #{source}..."
        
        FileUtils.copy( source, destfull )
      end
    end # each entry in manifest
    
    puts "Done (in #{Time.now-start} s)."
  end # method merge_pak

end # class Templater
end # module Pakman