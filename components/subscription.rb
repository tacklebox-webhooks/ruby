require_relative "../apis/subscription_api"

class Subscription
  attr_accessor :api
  
  def initialize(config)
    self.api = SubscriptionApi.new(config)
  end
  
  def list(service_id, user_id)
    self.api.list_subscriptions(service_id, user_id)
  end
  
  def create(service_id, user_id, subscription_data)
    self.api.create_subscription(
      service_id,
      user_id,
      subscription_data
    )
  end
  
  def get(service_id, user_id, subscription_id)
    self.api.get_subscription(service_id, user_id, subscription_id)
  end
  
  # def get_secret(service_id, user_id, subscription_id)
  #   self.api.get_secret(service_id, user_id, subscription_id)
  # end

  # def delete(service_id, user_id, subscription_id)
  #   self.api.delete_subscription(service_id, user_id, subscription_id)
  # end
end
