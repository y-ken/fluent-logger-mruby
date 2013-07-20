class Fluent
  DEFAULTADDRESS  = "127.0.0.1"
  DEFAULTPORT     = 8888
  
  class Logger
    def initialize(tag_prefix, address=nil, port=nil)
      address = DEFAULTADDRESS if address.nil?
      port   = DEFAULTPORT if port.nil?
      @url = "http://#{address}:#{port}/#{tag_prefix}"
    end

    def post(tag, data)
      http = HttpRequest.new()
      http.post("#{@url}#{tag}", {
        :json => JSON::stringify(data),
      },{
        'Content-Type' => 'application/x-www-form-urlencoded',
      })
    end
  end
end
