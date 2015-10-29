# mruby-fluent-logger 

mruby-fluent-logger (a.k.a. fluent-logger-mruby) is a structured logger class for Fluentd.

## Requirements

* mruby
https://github.com/mruby/mruby

## Articles

* mrubyからイベントログ収集ツールFluentdを扱う"mruby-fluent-logger"を公開しました  
http://y-ken.hatenablog.com/entry/fluent-logger-mruby-has-released

## Install

Let's add these gem line into `build_config.rb` and execute `rake` to build mruby.  
Another way to use this mrbgems, you can generate a build configuration with [mgem](http://blog.mruby.sh/201301040627.html).

#### for Unix/Linux/MacOSX

```
MRuby::Build.new do |conf|
  ...snip...

  conf.gem :git => 'https://github.com/iij/mruby-io.git'
  conf.gem :git => 'https://github.com/iij/mruby-socket.git'
  conf.gem :git => 'https://github.com/iij/mruby-pack.git'
  conf.gem :git => 'https://github.com/suzukaze/mruby-msgpack.git'
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
  conf.gem :git => 'https://github.com/suzukaze/mruby-msgpack.git'
  conf.gem :git => 'https://github.com/mattn/mruby-uv.git'
  conf.gem :git => 'https://github.com/mattn/mruby-http.git'
  conf.gem :git => 'https://github.com/matsumoto-r/mruby-simplehttp.git'
  conf.gem :git => 'https://github.com/matsumoto-r/mruby-httprequest.git'
  conf.gem :git => 'https://github.com/y-ken/fluent-logger-mruby.git'

  ...snip...
end
```

## Usage

- [in_http](http://docs.fluentd.org/articles/in_http) (http input plugin).
- [in_forward](http://docs.fluentd.org/articles/in_forward) (forward Input Plugin)(Required `protocol` argument.).

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

with `protocol` argument(`:protocol => http`).

```ruby
log = Fluent::Logger.new(nil, :protocol=>'http', :host=>'127.0.0.1', :port=>'8888')
log.post('test.hoge', {"message"=>"foo"})

# output: test.hoge: {"message":"foo"}
```

#### Singleton

It's welcome pull requesting because it doesn't supported yet.

#### Tag prefix

```ruby
log = Fluent::Logger.new('myapp', :host=>'127.0.0.1', :port=>8888)
log.post('access', {"agent"=>"foo"})

# output: myapp.access {"agent":"foo"}
```

#### forward to 24224

Required `protocol` argument.

```ruby
log = Fluent::Logger.new(nil, :protocol=> 'tcp', :host=>'127.0.0.1', :port=>'24224')
log.post('test.hoge', {"message"=>"foo"})

# output: test.hoge: {"message":"foo"}
```

with Tag prefix.

```ruby
log = Fluent::Logger.new("mruby.tcp", :protocol=>'tcp', :host=>'127.0.0.1', :port=>'24224')
log.post('test.hoge', {"message"=>"foo"})

# output: mruby.tcp.test.hoge: {"message":"foo"}
```

## TODO

Pull requests are very welcome!!
I'm awaiting pull requests like below.

* support fluentd forward input (port 24224)

## Copyright

Copyright © 2013- Kentaro Yoshida (@yoshi_ken)

## License

* MIT License
http://www.opensource.org/licenses/mit-license.php
