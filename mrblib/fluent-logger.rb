class Fluent
  DEFAULTADDRESS  = "127.0.0.1"
  DEFAULTPORT     = 24224
  
  class Logger
    def initialize(tag_prefix, address, port)
      adress = DEFAULTADDRESS if adress.nil?
      port   = DEFAULTAPORT if adress.nil?
      @url = 'http://#{address}:#{port}/#{tag_prefix}'
      puts "Fluent::Logger initialized #{@url}"
    end

    def post(tag, data)
      puts "#{@url}#{tag}"
      puts "post #{data}"
      http = HttpRequest.new()
      http.post("#{@url}#{tag}", {
        :json => JSON::stringify(data),
      },{
        'User-Agent' => "mruby-fluent-logger",
        "Content-Type" => 'application/x-www-form-urlencoded',
      })
    end
  end
end
