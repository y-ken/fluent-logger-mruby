# mruby-fluent-logger

## Usage

```ruby
logger = Fluent::Logger.new('debug.','127.0.0.1', 24224)
logger.post('applog', {"uid"=>"1234","action"=>"something"})
```