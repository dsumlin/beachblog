
# core and stlibs

require 'yaml'
require 'pp'
require 'fileutils'
require 'erb'



class Env

  def self.home
    path = if( ENV['HOME'] || ENV['USERPROFILE'] )
             ENV['HOME'] || ENV['USERPROFILE']
           elsif( ENV['HOMEDRIVE'] && ENV['HOMEPATH'] )
             "#{ENV['HOMEDRIVE']}#{ENV['HOMEPATH']}"
           else
             begin
                File.expand_path('~')
             rescue
                if File::ALT_SEPARATOR
                   'C:/'
                else
                   '/'
                end
              end
            end
     
    # todo: use logger - how?
    ## puts "env home=>#{path}<"
    
    path
  end

end # class Env


class Props

  VERSION = '1.0.0'

  attr_reader :path
  attr_reader :parent
    
  def initialize( hash, path, parent=nil)
    @hash   = hash
    @path   = path
    @parent = parent
  end
    
  def self.load_file( path, parent=nil )
    h = YAML.load_file( path )
    Props.new( h, path, parent )
  end
  
  ### todo: use TOP_LEVEL_BINDING for binding default?
  def self.load_file_with_erb( path, binding, parent=nil )  # run through erb first
    text = ERB.new( File.read( path ) ).result( binding )
    h = YAML.load( text )
    Props.new( h, path, parent )
  end
    
  def dump   # for debugging
    puts "dump of >#{@path}<:"
    pp @hash
  end

    
  def fetch(key, default)
    value = get( key )
    value.nil? ? default : value
  end
  
  def fetch_from_section(section, key, default)
    value = get_from_section( section, key )
    value.nil? ? default : value
  end

  def [](key)  get( key );  end

  def get( key )
    value = @hash.fetch( key.to_s, nil )
    # if not found try lookup in parent hash
    (value.nil? && parent) ? parent.get(key) : value
  end

  def get_from_section( section, key )
    value = @hash.fetch( section.to_s, {} ).fetch( key.to_s, nil )
    # if not found try lookup in parent hash
    (value.nil? && parent) ? parent.get_from_section(section,key) : value
  end

end # class Props