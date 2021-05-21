require_relative "error"
require_relative "http_request"
require_relative "http_client"

class ServiceApi
  include Validation
  
  attr_accessor :base_url, :http_client, :stage
  
  def initialize(config)
    self.base_url = config[:base_url]
    self.stage = config[:stage]
    self.http_client = HttpClient.new(config[:api_key])
  end

  def list_services
    path = "/#{@stage}/services"
    request = HttpRequest.new("GET", @base_url, path)
    self.http_client.send(request)
  end

  def create_service(service_data)
    if !self.is_valid_data(service_data)
      return new_error(
        ERROR_TYPES['missing_parameter'],
        "The create_service method must be invoked with a non-empty string name argument."
      )
    end

    path = "/#{@stage}/services"
    request = HttpRequest.new("POST", @base_url, path, service_data)
    self.http_client.send(request)
  end

  def delete_service(service_id)
    if !self.is_valid_id(service_id)
      return new_error(
        ERROR_TYPES['missing_parameter'],
        "The get_service method must be invoked with a non-empty string service_id argument."
      )
    end
    
    url = "#{self.base_url}/#{service_id}"
    request = HttpRequest.new("DELETE", url)
    self.http_client.send(request)
  end

  def get_service(service_id)
    if !self.is_valid_id(service_id)
      return new_error(
        ERROR_TYPES['missing_parameter'],
        "The get_service method must be invoked with a non-empty string service_id argument."
      )
    end

    path = "/#{@stage}/services/#{service_id}"
    request = HttpRequest.new("GET", @base_url, path)
    self.http_client.send(request)
  end
end
