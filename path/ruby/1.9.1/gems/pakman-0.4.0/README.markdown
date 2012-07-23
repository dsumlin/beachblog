## `pakman` - Template Pack Manager in Ruby

* [geraldb.github.com/pakman](http://geraldb.github.com/pakman)

## Usage - Ruby Code

Fetch a template pack:

```ruby
Pakman::Fetcher.new( logger ).fetch_pak( src, pakpath )
```

Copy a template pack from your cache:

```ruby
Pakman::Copier.new( logger ).copy_pak( src, pakpath )
```

Merge a template pack from your cache:

```ruby
Pakman::Templater.new( logger ).merge_pak( src, pakpath, binding, name )
```


List all template packs in your cache (using passed in search path):

```ruby
patterns  = [
  "#{File.expand_path('~/.pak')}/*.txt",
  "#{File.expand_path('~/.pak')}/*/*.txt",
  "*.txt",
  "*/*.txt"
]

Pakman::Finder.new( logger ).find_manifests( patterns )
```


## Usage - Command Line

The `pakman` gem includes a little command line tool. Try `pakman -h` for details:

```
pakman - Lets you manage template packs.

Usage: pakman [options]
    -f, --fetch URI                  Fetch Templates
    -t, --template MANIFEST          Generate Templates
    -l, --list                       List Installed Templates
    -c, --config PATH                Configuration Path (default is ~/.pak)
    -o, --output PATH                Output Path (default is .)
    -v, --version                    Show version
        --verbose                    Show debug trace
    -h, --help                       Show this message
```

## Install

Just install the gem:

    $ gem install pakman


## Real World Usage

The [`slideshow`](http://slideshow.rubyforge.org) (also known as Slide Show (S9)) gem
that lets you create slide shows
and author slides in plain text using a wiki-style markup language that's easy-to-write and easy-to-read.

## Real World Template Packs

* [S6 Template Pack](https://github.com/geraldb/slideshow-s6-blank)
* [impress.js Template Pack](https://github.com/geraldb/slideshow-impress.js)
* [deck.js Template Pack](https://github.com/geraldb/slideshow-deck.js)

## License

The `pakman` scripts are dedicated to the public domain.
Use it as you please with no restrictions whatsoever.