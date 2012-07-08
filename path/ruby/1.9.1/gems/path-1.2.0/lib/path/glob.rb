module Path
  require 'path/name'

  # = Glob
  #
  # A lazy resolution variation of Path::Name.
  #
  class Glob < Name

    def to_s
      Dir.glob(super).first
    end

  end

end

