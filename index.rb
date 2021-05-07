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

ch = CaptainHook.new('42SJR6LXm75C1rBQjcMfB4egZa8D4SUn7NQFRA6S', 'https://u69bucrg1m.execute-api.us-east-1.amazonaws.com')

# response = ch.service.list

# response = ch.event_type.list('bb13ad69-d5ba-41d2-b5de-a6bc35bf0e31')

# response = ch.user.list('bb13ad69-d5ba-41d2-b5de-a6bc35bf0e31')

# event_data = {
#   'event_type' => '5_5_new_event_type',
#   'payload' => 'hello',
#   'idempotency_key' => '123321'
# }
# response = ch.event.create('bb13ad69-d5ba-41d2-b5de-a6bc35bf0e31', '481c88de-f655-468b-b057-c2c4cae3e1eb', event_data)

# response = ch.subscription.list('bb13ad69-d5ba-41d2-b5de-a6bc35bf0e31', '06a3e00b-21c5-4ad4-99b2-ff18f45ad895')

# subscription_data = {
#   'url' => 'https://en7k3c3kwpay.x.pipedream.net',
#   'event_types' => ['5_5_new_event_type']
# }
# response = ch.subscription.create('bb13ad69-d5ba-41d2-b5de-a6bc35bf0e31', '481c88de-f655-468b-b057-c2c4cae3e1eb', subscription_data)

response = ch.message.list('bb13ad69-d5ba-41d2-b5de-a6bc35bf0e31', '481c88de-f655-468b-b057-c2c4cae3e1eb')

# response = ch.service.list

p response
