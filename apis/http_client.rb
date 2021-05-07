require "faraday"
require "json"
require_relative "error"

MAX_RETRY_ATTEMPTS = 5
MAX_TIMEOUT = 5

class HttpClient
  def initialize(api_key)
    @headers = {
      "Authorization" => api_key,
      "Content-Type" => "application/json",
    }
  end

  def send(request)
    conn = Faraday.new(
      url: request.base_url,
      headers: @headers,
      request: { timeout: MAX_TIMEOUT }
    )

    while request.attempt <= MAX_RETRY_ATTEMPTS
      begin
        case request.method
        when "GET"
          response = conn.get(request.path)
          return JSON.parse(response.body)
        when "POST"
          response = conn.post(request.path) do |req|
            req.body = request.data.to_json
          end
          return JSON.parse(response.body)
        when "PUT"
          response = conn.put(request.path) do |req|
            req.body = request.data.to_json
          end
          return JSON.parse(response.body)
        when "DELETE"
          response = conn.delete(request.path)
          return JSON.parse(response.body)
        end
      rescue Faraday::ConnectionFailed => e
        puts "Connection failed: #{e}"
        exit 1
      end
      
      request.attempt += 1;
      
    end
  end
end
