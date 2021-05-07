require_relative "../apis/event_api"

class Event
  attr_accessor :api
  
  def initialize(config)
    self.api = EventApi.new(config)
  end
  
  def list(service_id, user_id)
    self.api.list_events(service_id, user_id)
  end
  
  def create(service_id, user_id, event_data)
    self.api.create_event(service_id, user_id, event_data)
  end
  
  def get(service_id, user_id, event_id)
    self.api.get_event(service_id, user_id, event_id)
  end
end
