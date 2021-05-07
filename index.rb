require_relative "./components/authorization"
require_relative "./components/service"
require_relative "./components/event_type"
require_relative "./components/user"
require_relative "./components/subscription"
require_relative "./components/event"
require_relative "./components/message"

class CaptainHook
  attr_accessor :service, :event_type, :user, :subscription, :event, :message
  
  def initialize(api_key, base_url)
    config = {
      api_key: api_key,
      base_url: base_url, # this will be different for each user of the service
      stage: 'test'
    }
    
    # self.configuration = config
    # self.authorization = Authorization.new(config)
    self.service = Service.new(config)
    self.event_type = EventType.new(config)
    self.user = User.new(config)
    self.subscription = Subscription.new(config)
    self.event = Event.new(config)
    self.message = Message.new(config)
  end
end
