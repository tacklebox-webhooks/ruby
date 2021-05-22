require_relative "error"
require_relative "http_request"
require_relative "http_client"

class EventApi
  include Validation
  
  attr_accessor :base_url, :http_client
  
  def initialize(config)
    self.base_url = config[:base_url]
    self.http_client = HttpClient.new(config[:api_key])
  end

  def list_events(service_id, user_id)
    if !self.is_valid_id(service_id)
      return new_error(
        ERROR_TYPES['missing_parameter'],
        "The list_events method must be invoked with a non-empty string service_id argument."
      )
    end
    
    if !self.is_valid_id(user_id)
      return new_error(
        ERROR_TYPES['missing_parameter'],
        "The list_events method must be invoked with a non-empty string user_id argument."
      )
    end

    path = "services/#{service_id}/users/#{user_id}/events"
    request = HttpRequest.new("GET", @base_url, path)
    @http_client.send(request)
  end

  def create_event(service_id, user_id, event_data)
    if !self.is_valid_id(service_id)
      return new_error(
        ERROR_TYPES['missing_parameter'],
        "The create_event method must be invoked with a non-empty string service_id argument."
      )
    end
    
    if !self.is_valid_id(user_id)
      return new_error(
        ERROR_TYPES['missing_parameter'],
        "The create_event method must be invoked with a non-empty string user_id argument."
      )
    end
    
    if !self.is_valid_event_data(event_data)
      return new_error(
        ERROR_TYPES['missing_parameter'],
        "The create_event method must be invoked with an event_data argument containing non-empty event_type and payload properties."
      )
    end

    path = "services/#{service_id}/users/#{user_id}/events"
    request = HttpRequest.new("POST", @base_url, path, event_data)
    @http_client.send(request)
  end

  def get_event(service_id, user_id, event_id)
    if !self.is_valid_id(service_id)
      return new_error(
        ERROR_TYPES['missing_parameter'],
        "The get_event method must be invoked with a non-empty string service_id argument."
      )
    end
    
    if !self.is_valid_id(user_id)
      return new_error(
        ERROR_TYPES['missing_parameter'],
        "The get_event method must be invoked with a non-empty string user_id argument."
      )
    end
    
    if !self.is_valid_id(event_id)
      return new_error(
        ERROR_TYPES['missing_parameter'],
        "The get_event method must be invoked with a non-empty string event_id argument."
      )
    end

    path = "services/#{service_id}/users/#{user_id}/events/#{event_id}"
    request = HttpRequest.new("GET", @base_url, path)
    @http_client.send(request)
  end
end
