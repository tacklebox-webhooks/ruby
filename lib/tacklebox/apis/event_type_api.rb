require_relative "error"
require_relative "http_request"
require_relative "http_client"

class EventTypeApi
  include Validation
  
  attr_accessor :base_url, :http_client
  
  def initialize(config)
    self.base_url = config[:base_url]
    self.http_client = HttpClient.new(config[:api_key])
  end

  def list_event_types(service_id)
    if !self.is_valid_id(service_id)
      return new_error(
        ERROR_TYPES['missing_parameter'],
        "The list_event_types method must be invoked with a non-empty string service_id argument."
      )
    end

    path = "services/#{service_id}/event_types"
    request = HttpRequest.new("GET", @base_url, path)
    @http_client.send(request)
  end

  def create_event_type(service_id, event_type_data)
    if !self.is_valid_id(service_id)
      return new_error(
        ERROR_TYPES['missing_parameter'],
        "The create_event_types method must be invoked with a non-empty string service_id argument."
      )
    elsif !self.is_valid_data(event_type_data)
      return new_error(
        ERROR_TYPES['missing_parameter'],
        "The create_event_types method must be invoked with an event_type_data object that contains a non-empty string name property."
      )
    end

    path = "services/#{service_id}/event_types"
    request = HttpRequest.new("POST", @base_url, path, event_type_data)
    @http_client.send(request)
  end

  def delete_event_type(service_id, event_type_id)
    if !self.is_valid_service_id(service_id)
      return new_error(
        ERROR_TYPES['missing_parameter'],
        "The delete_event_type method must be invoked with a non-empty string service_id argument."
      )
    elsif !self.event_type_id(event_type_id)
      return new_error(
        ERROR_TYPES['missing_parameter'],
        "The delete_event_type method must be invoked with a non-empty string event_type_id argument."
      )
    end
    
    path = "services/#{service_id}/event_types/#{event_type_id}"
    request = HttpRequest.new("DELETE", @base_url, path)
    @http_client.send(request)
  end

  def get_event_type(service_id, event_type_id)
    if !self.is_valid_service_id(service_id)
      return new_error(
        ERROR_TYPES['missing_parameter'],
        "The get_event_type method must be invoked with a non-empty string service_id argument."
      )
    elsif !self.event_type_id(event_type_id)
      return new_error(
        ERROR_TYPES['missing_parameter'],
        "The get_event_type method must be invoked with a non-empty string event_type_id argument."
      )
    end

    path = "services/#{service_id}/event_types/#{event_type_id}"
    request = HttpRequest.new("GET", @base_url, path)
    @http_client.send(request)
  end
end
