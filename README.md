# mruby-fluent-logger 

mruby-fluent-logger (a.k.a. fluent-logger-mruby) is a structured logger class for Fluentd.

## Requirements

* mruby  
https://github.com/mruby/mruby

## Install

Let's add these gem line into `build_config.rb` and execute `rake` to build mruby.

#### for Unix/Linux/MacOSX

```
MRuby::Build.new do |conf|
  ...snip...

  conf.gem :git => 'https://github.com/iij/mruby-io.git'
  conf.gem :git => 'https://github.com/iij/mruby-socket.git'
  conf.gem :git => 'https://github.com/iij/mruby-pack.git'
  conf.gem :git => 'https://github.com/mattn/mruby-json.git'
  conf.gem :git => 'https://github.com/mattn/mruby-http.git'
  conf.gem :git => 'https://github.com/y-ken/mruby-simplehttp-socket.git'
  conf.gem :git => 'https://github.com/matsumoto-r/mruby-httprequest.git'
  conf.gem :git => 'https://github.com/y-ken/fluent-logger-mruby.git'

  ...snip...
end
```

#### for Multi Platform

install required package.

* [libuv](https://github.com/joyent/libuv)

```
MRuby::Build.new do |conf|
  ...snip...

  conf.gem :git => 'https://github.com/iij/mruby-pack.git'
  conf.gem :git => 'https://github.com/mattn/mruby-json.git'
  conf.gem :git => 'https://github.com/mattn/mruby-uv.git'
  conf.gem :git => 'https://github.com/mattn/mruby-http.git'
  conf.gem :git => 'https://github.com/matsumoto-r/mruby-simplehttp.git'
  conf.gem :git => 'https://github.com/matsumoto-r/mruby-httprequest.git'
  conf.gem :git => 'https://github.com/y-ken/fluent-logger-mruby.git'

  ...snip...
end
```

## Usage

Currentry, it's only compatible with [in_http](http://docs.fluentd.org/articles/in_http) (http input plugin).

#### Simple

```ruby
log = Fluent::Logger.new()
log.post('myapp.access', {"agent"=>"foo"})

# output: myapp.access {"agent":"foo"}
```

```ruby
log = Fluent::Logger.new(nil, :host=>'127.0.0.1', :port=>8888)
log.post('myapp.access', {"agent"=>"foo"})

# output: myapp.access {"agent":"foo"}
```

#### Singleton

It's welcome pull requesting because it doesn't supported yet.

#### Tag prefix

```ruby
log = Fluent::Logger.new('myapp', :host=>'127.0.0.1', :port=>8888)
log.post('access', {"agent"=>"foo"})

# output: myapp.access {"agent":"foo"}
```

## TODO

Pull requests are very welcome!!

* support MessagePack after mruby-msgpack gets released.

## Copyright

Copyright © 2013- Kentaro Yoshida (@yoshi_ken)

## License

* MIT License  
http://www.opensource.org/licenses/mit-license.php
