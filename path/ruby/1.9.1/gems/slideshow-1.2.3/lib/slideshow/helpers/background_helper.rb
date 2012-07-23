module Slideshow
  module BackgroundHelper

def gradient_from_headers( *args )

  return "" unless headers.has_gradient?   # do nothing if use hasn't set gradient headers (ignore defaults)

  # lets you use headers (gradient, gradient-theme, gradient-colors)
  #  to define gradient (see http://slideshow.rubyforge.org/themes.html for predefined themes)
  
  theme  = headers[ :gradient_theme ]
  colors = headers[ :gradient_colors ].split(' ')  # colors as space separated all-in-one string
  
  buf = ""
  
  if theme == 'diagonal'
    buf << "linear-gradient( top left, #{colors.join(', ')} )"
  elsif theme == 'top-bottom'
    buf << "linear-gradient( top, #{colors.join(', ')} )"
  elsif theme == 'left-right'
    buf << "linear-gradient( left, #{colors.join(', ')} )"
  elsif theme == 'repeat'
    buf << "repeating-linear-gradient( -60deg, #{colors.join(', ')} 10% )"
  elsif theme == 'radial'
    buf << "radial-gradient( #{colors.join(', ')} )"
  elsif theme == 'radial-off-center'
    buf << "radial-gradient( 70% 70%, ellipse, #{colors.join(', ')} )"
  elsif theme == 'radial-repeat'
    buf << "repeating-radial-gradient( 60% 60%, ellipse, #{colors.join(', ')} 10% )"
  else
    buf << "linear-gradient( #{colors.join(', ')} )"
    puts "warning: unknown gradient themes #{theme} - falling back to default"
  end

  puts "  Adding CSS for gradient background style rule using headers..."
  puts "    gradient-theme: #{theme}"
  puts "    gradient-colors: #{colors.join(' ')}"
  
  content_for( :css, <<-EOS )
     /****
       * generated by gradient_from_headers helper; using headers: 
       *   gradient-theme: #{theme}
       *   gradient-colors: #{colors.join(' ')}
       */
    .slide    { background-image: -webkit-#{buf};
                background-image: -moz-#{buf};
                background-image: -ms-#{buf};
                background-image: -o-#{buf};
                background-image: #{buf};
              }
  EOS
end

def gradient( *args )

  # check for optional hash for options
  opts = args.last.kind_of?(Hash) ? args.pop : {}

  colors = args

  clazz = opts[:class] || ( 's9_gradient_linear_'+colors.join('_').gsub( /[(), ]/, '_' ).gsub( /_{2,}/, '_').gsub( /[^-\w]/, '' ) )


  ## generate code
  
  buf  = "linear-gradient(top, #{colors.join(', ')} )"
 

  puts "  Adding CSS for background style rule..."  
  content_for( :css, <<-EOS )
    .#{clazz} { background-image: -webkit-#{buf};
                background-image: -moz-#{buf};
                background-image: -ms-#{buf};
                background-image: -o-#{buf};
                background-image: #{buf};
              }
  EOS

  # add processing instruction to get style class added to slide 

  puts "  Adding HTML PI for background style class '#{clazz}'..."    
  "<!-- _S9STYLE_ #{clazz} -->\n"
end

def background( *args  )
  
 # make everyting optional; use it like: 
 #   background( code, opts={} )
  
  # check for optional hash for options
  opts = args.last.kind_of?(Hash) ? args.pop : {}

  # check for optional style rule code
  code = args.last.kind_of?(String) ? args.pop : '' 
    
  clazz = opts[:class] || ( 's9'+code.strip.gsub( /[(), ]/, '_' ).gsub( /_{2,}/, '_').gsub( /[^-\w]/, '' ) )
  
  # 1) add background rule to css 
  # e.g. .simple { background: -moz-linear-gradient(top, blue, white); }
  
  unless code.empty?
    puts "  Adding CSS for background style rule..."  
    content_for( :css, <<-EOS )
      .#{clazz} { background: #{code}; }
    EOS
  end
  
  # 2) add processing instruction to get style class added to slide 

  puts "  Adding HTML PI for background style class '#{clazz}'..."    
  "<!-- _S9STYLE_ #{clazz} -->\n"
end 

    
  
end # module BackgroundHelper
end # module Slideshow

class Slideshow::Gen
  include Slideshow::BackgroundHelper
end
