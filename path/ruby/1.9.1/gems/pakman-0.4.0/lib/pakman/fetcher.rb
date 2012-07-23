module Pakman

class Fetcher

  attr_reader :logger
    
  def initialize( logger )
    @logger   = logger
  end


  def fetch_pak( manifestsrc, pakpath )

    start = Time.now

    uri = URI.parse( manifestsrc )
  
    logger.debug "scheme: #{uri.scheme}, host: #{uri.host}, port: #{uri.port}, path: #{uri.path}"
  
    dirname  = File.dirname( uri.path )
    filename = File.basename( uri.path )       # e.g. fullerscreen.txt (with extension)

    pakname = Pakman.pakname_from_file( uri.path )

    logger.debug "dirname >#{dirname}<"
    logger.debug "filename >#{filename}<"
    logger.debug "pakname >#{pakname}<"

    dlbase = "#{uri.scheme}://#{uri.host}:#{uri.port}#{dirname}"
    logger.debug "dlbase: #{dlbase}"
    logger.debug "pakpath: #{pakpath}"

    FileUtils.makedirs( pakpath ) unless File.directory?( pakpath )

    puts "Fetching template pack '#{pakname}'"
    puts "    from '#{dlbase}'"
    puts "    saving to '#{pakpath}'"
  
    # step 1: download manifest
    manifestdest = "#{pakpath}/#{filename}"

    puts "  Downloading manifest '#{filename}'..."

    fetch_file( manifestsrc, manifestdest )

    manifest = Manifest.load_file_core( logger, manifestdest )
      
    # step 2: download files & templates listed in manifest
    manifest.each do |entry|
      source = entry[1]

      # get full (absolute) path and make sure path exists
      destfull = File.expand_path( source, pakpath )  # NB: turning source into dest
      destpath = File.dirname( destfull )
      FileUtils.makedirs( destpath ) unless File.directory?( destpath )

      logger.debug "destfull=>#{destfull}<"
      logger.debug "destpath=>#{destpath}<"

      sourcefull = "#{dlbase}/#{source}"
    
      if source =~ /\.erb\.|.erb$/
        puts "  Downloading template '#{source}'..."
      else
        puts "  Downloading file '#{source}'..."
      end

      fetch_file( sourcefull, destfull )
    end   
    puts "Done (in #{Time.now-start} s)."
  end # method fetch_pak

private

  def fetch_file( src, dest )
     ## note: code moved to its own gem, that is, fetcher
     ## see https://github.com/geraldb/fetcher
    
    ::Fetcher::Worker.new( logger ).copy( src, dest )
  end

end # class Fetcher
end # module Pakman