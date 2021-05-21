require_relative "error"
require_relative "http_request"
require_relative "http_client"

class SubscriptionApi
  include Validation
  
  attr_accessor :base_url, :http_client, :stage
  
  def initialize(config)
    self.base_url = config[:base_url]
    self.stage = config[:stage]
    self.http_client = HttpClient.new(config[:api_key])
  end

  def list_subscriptions(service_id, user_id)
    if !self.is_valid_id(service_id)
      return new_error(
        ERROR_TYPES['missing_parameter'],
        "The list_subscriptions method must be invoked with a non-empty string service_id argument."
      )
    end
    if !self.is_valid_id(user_id)
      return new_error(
        ERROR_TYPES['missing_parameter'],
        "The list_subscriptions method must be invoked with a non-empty string user_id argument."
      )
    end

    path = "/#{@stage}/services/#{service_id}/users/#{user_id}/subscriptions"
    request = HttpRequest.new("GET", @base_url, path)
    @http_client.send(request)
  end

  def create_subscription(service_id, user_id, subscription_data)
    if !self.is_valid_id(service_id)
      return new_error(
        ERROR_TYPES['missing_parameter'],
        "The create_subscription method must be invoked with a non-empty string service_id argument."
      )
    end
    if !self.is_valid_id(user_id)
      return new_error(
        ERROR_TYPES['missing_parameter'],
        "The create_subscription method must be invoked with a non-empty string user_id argument."
      )
    end
    if !self.is_valid_subscription_data(subscription_data)
      return new_error(
        ERROR_TYPES['missing_parameter'],
        "The create_subscription method must be invoked with non-empty url and event_types arguments."
      )
    end

    path = "/#{@stage}/services/#{service_id}/users/#{user_id}/subscriptions"
    request = HttpRequest.new("POST", @base_url, path, subscription_data)
    @http_client.send(request)
  end

  def get_subscription(service_id, user_id, subscription_id)
    if !self.is_valid_id(service_id)
      return new_error(
        ERROR_TYPES['missing_parameter'],
        "The get_subscription method must be invoked with a non-empty string service_id argument."
      )
    end
    if !self.is_valid_id(user_id)
      return new_error(
        ERROR_TYPES['missing_parameter'],
        "The get_subscription method must be invoked with a non-empty string user_id argument."
      )
    end
    if !self.is_valid_id(subscription_id)
      return new_error(
        ERROR_TYPES['missing_parameter'],
        "The get_subscription method must be invoked with a non-empty string subscription_id argument."
      )
    end
    
    path = "/#{@stage}/services/#{service_id}/users/#{user_id}/subscriptions/#{subscription_id}"
    request = HttpRequest.new("GET", @base_url, path)
    @http_client.send(request)
  end
  
  def delete_subscription(service_id, user_id, subscription_id)
    if !self.is_valid_id(service_id)
      return new_error(
        ERROR_TYPES['missing_parameter'],
        "The delete_subscription method must be invoked with a non-empty string service_id argument."
      )
    end
    if !self.is_valid_id(user_id)
      return new_error(
        ERROR_TYPES['missing_parameter'],
        "The delete_subscription method must be invoked with a non-empty string user_id argument."
      )
    end
    if !self.is_valid_id(subscription_id)
      return new_error(
        ERROR_TYPES['missing_parameter'],
        "The delete_subscription method must be invoked with a non-empty string subscription_id argument."
      )
    end
    
    path = "/#{@stage}/services/#{service_id}/users/#{user_id}/subscriptions/#{subscription_id}"
    request = HttpRequest.new("DELETE", @base_url, path)
    @http_client.send(request)
  end
end
