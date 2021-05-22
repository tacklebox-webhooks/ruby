require_relative "tacklebox/components/service"
require_relative "tacklebox/components/event_type"
require_relative "tacklebox/components/user"
require_relative "tacklebox/components/subscription"
require_relative "tacklebox/components/event"
require_relative "tacklebox/components/message"

class Tacklebox
  attr_accessor :service, :event_type, :user, :subscription, :event, :message
  
  def initialize(api_key, base_url)
    config = {
      api_key: api_key,
      base_url: base_url,
    }
    
    self.service = Service.new(config)
    self.event_type = EventType.new(config)
    self.user = User.new(config)
    self.subscription = Subscription.new(config)
    self.event = Event.new(config)
    self.message = Message.new(config)
  end
end
