require_relative "error"
require_relative "http_request"
require_relative "http_client"

class MessageApi
  include Validation
  
  attr_accessor :base_url, :http_client, :stage
  
  def initialize(config)
    self.base_url = config[:base_url]
    self.stage = config[:stage]
    self.http_client = HttpClient.new(config[:api_key])
  end

  def list_messages(service_id, user_id)
    if !self.is_valid_id(service_id)
      return new_error(
        ERROR_TYPES['missing_parameter'],
        "The list_messages method must be invoked with a non-empty string service_id argument."
      )
    end
    if !self.is_valid_id(user_id)
      return new_error(
        ERROR_TYPES['missing_parameter'],
        "The list_messages method must be invoked with a non-empty string user_id argument."
      )
    end

    path = "/#{@stage}/services/#{service_id}/users/#{user_id}/messages"
    request = HttpRequest.new("GET", @base_url, path)
    @http_client.send(request)
  end

  def resend_message(service_id, user_id, message_id)
    if !self.is_valid_id(service_id)
      return new_error(
        ERROR_TYPES['missing_parameter'],
        "The resend_message method must be invoked with a non-empty string service_id argument."
      )
    end
    if !self.is_valid_id(user_id)
      return new_error(
        ERROR_TYPES['missing_parameter'],
        "The resend_message method must be invoked with a non-empty string user_id argument."
      )
    end
    if !self.is_valid_id(message_id)
      return new_error(
        ERROR_TYPES['missing_parameter'],
        "The resend_message method must be invoked with a non-empty string message_id argument."
      )
    end

    path = "/#{@stage}/services/#{service_id}/users/#{user_id}/messages/#{message_id}/resend"
    request = HttpRequest.new("POST", @base_url, path)
    @http_client.send(request)
  end

  def get_message(service_id, user_id, message_id)
    if !self.is_valid_id(service_id)
      return new_error(
        ERROR_TYPES['missing_parameter'],
        "The get_message method must be invoked with a non-empty string service_id argument."
      )
    end
    
    if !self.is_valid_id(user_id)
      return new_error(
        ERROR_TYPES['missing_parameter'],
        "The get_message method must be invoked with a non-empty string user_id argument."
      )
    end
    
    if !self.is_valid_id(message_id)
      return new_error(
        ERROR_TYPES['missing_parameter'],
        "The get_message method must be invoked with a non-empty string message_id argument."
      )
    end

    path = "/#{@stage}/services/#{service_id}/users/#{user_id}/messages/#{message_id}"
    request = HttpRequest.new("GET", @base_url, path)
    @http_client.send(request)
  end
end
