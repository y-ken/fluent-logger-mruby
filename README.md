# mruby-fluent-logger

mruby-fluent-logger is mruby structured logger class for Fluentd.

## Requirements

* libuv  
https://github.com/joyent/libuv

* mruby  
https://github.com/mruby/mruby

* mgem  
https://github.com/bovi/mgem-list

## Install

Let's add these gem line into `build_config.rb` and kick `rake` to build mruby.

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
log = Fluent::Logger.new(nil, :host=>'127.0.0.1', :port=>8888)
log.post('myapp.access', {"agent"=>"foo"})

# output: myapp.access {"agent":"foo"}
```

#### Singleton

it doesn't supported.

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
