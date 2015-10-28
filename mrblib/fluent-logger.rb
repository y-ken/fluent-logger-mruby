class Fluent

  class Logger
    def initialize(tag_prefix=nil, type=nil, *args)
      options = {
        :type => 'http',
        :host => 'localhost',
        :port => 8888
      }
      case args.first
        when String, Symbol
        options[:host] = args[0]
        options[:port] = args[1] if args[1]
        when Hash
        options.merge!(args.first)
      end
      @type = type if !type.nil?
      @host = options[:host]
      @port = options[:port]
      @tag_prefix = "#{tag_prefix}." if !tag_prefix.nil?
    end

    def http_post(tag, data)
      url = "http://#{@host}:#{@port}/#{@tag_prefix}"
      http = HttpRequest.new()
      http.post("#{url}#{tag}", {
        :msgpack => data.to_msgpack
      },{
        'Content-Type' => 'application/x-www-form-urlencoded',
      })
    end

    def tcp_post(tag, data)
      timestamp = Time.now.to_i
      tag = "#{@tag_prefix}" + tag
      record = [tag, timestamp, data]
      s = TCPSocket.open(@host, @port)
      s.write(record.to_msgpack)
      s.close
    end

    def post(tag, data)
      case @type
        when "tcp"
        tcp_post(tag, data)
        when "http"
        http_post(tag, data)
      end 
    end

  end
end
