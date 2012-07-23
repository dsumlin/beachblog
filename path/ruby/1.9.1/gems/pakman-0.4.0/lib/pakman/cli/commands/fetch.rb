module Pakman

class Fetch

  attr_reader :logger, :opts

  def initialize( logger, opts )
    @logger  = logger
    @opts    = opts
  end

  def run
    logger.debug "fetch_uri: >#{opts.fetch_uri}<"
    src = opts.fetch_uri
     
    uri = URI.parse( src )
    logger.debug "scheme: >#{uri.scheme}<, host: >#{uri.host}<, port: >#{uri.port}<, path: >#{uri.path}<"
    
    pakname = Pakman.pakname_from_file( uri.path )
    logger.debug "pakname: >#{pakname}<"  

    pakpath = File.expand_path( pakname, opts.config_path )
    logger.debug "pakpath: >#{pakpath}<"

    Fetcher.new( logger ).fetch_pak( src, pakpath )
  end # method run

end # class Fetch
end # module Pakman