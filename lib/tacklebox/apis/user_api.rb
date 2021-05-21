require_relative "error"
require_relative "http_request"
require_relative "http_client"

class UserApi
  include Validation
  
  attr_accessor :base_url, :http_client, :stage
  
  def initialize(config)
    self.base_url = config[:base_url]
    self.stage = config[:stage]
    self.http_client = HttpClient.new(config[:api_key])
  end

  def create_user(service_id, user_data)
    if !self.is_valid_id(service_id)
      return new_error(
        ERROR_TYPES['missing_parameter'],
        "The create_user method must be invoked with a non-empty string service_id argument."
      )
    end

    if !self.is_valid_data(user_data)
      return new_error(
        ERROR_TYPES['missing_parameter'],
        "The create_user method must be invoked with a non-empty string name argument."
      )
    end

    path = "/#{@stage}/services/#{service_id}/users"
    request = HttpRequest.new("POST", @base_url, path, user_data)
    @http_client.send(request)
  end

  def get_user(service_id, user_id)
    if !self.is_valid_id(service_id)
      return new_error(
        ERROR_TYPES['missing_parameter'],
        "The get_user method must be invoked with a non-empty string service_id argument."
      )
    end

    if !self.is_valid_id(user_id)
      return new_error(
        ERROR_TYPES['missing_parameter'],
        "The get_user method must be invoked with a non-empty string user_id argument."
      )
    end

    path = "/#{@stage}/services/#{service_id}/users/#{user_id}"
    request = HttpRequest.new("GET", @base_url, path)
    @http_client.send(request)
  end

  def list_users(service_id)
    if !self.is_valid_id(service_id)
      return new_error(
        ERROR_TYPES['missing_parameter'],
        "The list_users method must be invoked with a non-empty string service_id argument."
      )
    end

    path = "/#{@stage}/services/#{service_id}/users"
    request = HttpRequest.new("GET", @base_url, path)
    @http_client.send(request)
  end

  # def delete_service(service_id)
  #   path = "/#{service_id}"
  #   request = HttpRequest.new("DELETE", @base_url, path)
  #   @http_client.send(request)
  # end
end
