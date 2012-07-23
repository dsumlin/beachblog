# `props` -  Manage Settings Hierachies (Commandline, User, Home, Defaults, etc.)

## Description

TBD

## Usage

Example:

```
class Config

  DEFAULTS = { 'libs' => [ 'kramdown' ],
               'extnames' => [
                 '.markdown',
                 '.m',
                 '.mark',
                 '.mkdn',
                 '.md',
                 '.mdown',
                 '.markdn',
                 '.txt',
                 '.text' ],
                'redcarpet' => {
                 'extensions' => [
                    'no_intra_emphasis',
                    'fenced_code_blocks',
                    'tables',
                    'strikethrough' ] }
             }

  def initialize
    @props = @props_default = Props.new( DEFAULTS, 'DEFAULTS' )

    # check for user settings (markdown.yml) in home folder

    props_home_file = File.join( Env.home, 'markdown.yml' )
    if File.exists?( props_home_file )
      puts "Loading settings from '#{props_home_file}'..."
      @props = @props_home = Props.load_file( props_home_file, @props )
    end
      
    # check for user settings (markdown.yml) in working folder
    
    props_work_file = File.join( '.', 'markdown.yml' )
    if File.exists?( props_work_file )
      puts "Loading settings from '#{props_work_file}'..."
      @props = @props_work = Props.load_file( props_work_file, @props )
    end
  end

  def markdown_extnames
    @props.fetch( 'extnames', nil )
  end

  ...
  
end # class Config
```


## Install

Just install the gem:

    $ gem install props


## Real World Usage

The [`slideshow`](http://slideshow.rubyforge.org) gem (also known as Slide Show (S9))
that lets you create slide shows
and author slides in plain text using a wiki-style markup language that's easy-to-write and easy-to-read.

The [`markdown`](http://geraldb.github.com/markdown) gem that lets you use your markdown library
of choice.

## Alternatives

* [`configtoolkit`](http://configtoolkit.rubyforge.org) gem

## License

The `props` scripts are dedicated to the public domain.
Use it as you please with no restrictions whatsoever.