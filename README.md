# Iso::Init

This is a gem to help Isolate object initialization.

What's wrong with the following?

```ruby
SomeKlass = Class.new(Struct.new(options))
options = {foo: bar}
object = SomeKlass.new(options)
object.options
# => { :foo => :bar }
options[:baz] = bingo # DANGER, WILL ROBINSON
object.options
# => { :foo => :bar, :baz : bingo }
```

That's right. You passed an object by reference, so when that object changed,
all references to it also changed, which was not what you intended to do.

`IsoInit` fixes that.

## Installation

Add this line to your application's Gemfile:

    gem 'iso-init'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install iso-init

## Usage

```ruby
SomeKlass = Class.new(Struct.new(options)) { include IsoInit }
options = {foo: bar}
object = SomeKlass.new(options)
object.options
# => { :foo => :bar }
options[:baz] = bingo # DANGER, WILL ROBINSON ???
object.options
# => { :foo => :bar }
# Sweet! It didn't change!
object.options.frozen?
# => true
# ok. that's what I was hoping for. yay.
```

If an object is immutable, it won't be dup'd (e.g., `true`, `nil`, `1`, `3.1415926`), but if it is mutable, `initialize` will be called with a frozen duplicate.

Sweeeeet.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request


## License

Dual-licensed under [MIT][] and [WTFPL][].

[MIT]: http://en.wikipedia.org/wiki/MIT_License
[WTFPL]: http://en.wikipedia.org/wiki/WTFPL
