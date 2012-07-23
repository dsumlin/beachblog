module Pakman

class Template

  def initialize( path )
    @path = path
  end

  def render( binding )
    ERB.new( load_template() ).result( binding )
  end

private
  def load_template
    puts "  Loading template >#{@path}<..."
    File.read( @path )
  end

end # class Template
end # module Pakman