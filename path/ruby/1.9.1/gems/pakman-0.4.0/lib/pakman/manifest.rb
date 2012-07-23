module Pakman

class Manifest

  attr_reader :logger
    
  def initialize( logger )
    @logger   = logger
    @manifest = []
  end

  def self.load_file_core( logger, path )
    obj = self.new( logger )
    obj.load_file_core_worker( path )
    obj
  end
  
  def self.load_file( logger, path )
    obj = self.new( logger )
    obj.load_file_worker( path )
    obj
  end

  def each
    @manifest.each { |ary| yield ary }
  end



  def load_file_core_worker( path )
    @manifest = []
  
    File.open( path ).readlines.each_with_index do |line,i|
      case line
      when /^\s*$/
        # skip empty lines
      when /^\s*#.*$/
        # skip comment lines
      else
        logger.debug "line #{i+1}: #{line.strip}"
        values = line.strip.split( /[ <,+]+/ )
        
        # add source for shortcuts (assumes relative path; if not issue warning/error)
        values << values[0] if values.size == 1
                
        @manifest << values
      end
    end
  end

  def load_file_worker( path )
    filename = path
 
    puts "  Loading template manifest #{filename}..."  
    load_file_core_worker( filename )
    
    # post-processing
    # normalize all source paths (1..-1) /make full path/add template dir

    templatesdir = File.dirname( path )
    logger.debug "templatesdir=#{templatesdir}"

    @manifest.each do |values|
      (1..values.size-1).each do |i|
        values[i] = "#{templatesdir}/#{values[i]}"
        logger.debug "  path[#{i}]=>#{values[i]}<"
      end
    end
  end


end  # class Manifest
end  # module Pakman
