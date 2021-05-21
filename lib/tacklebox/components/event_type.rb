require_relative "../apis/event_type_api"

class EventType
  attr_accessor :api
  
  def initialize(config)
    self.api = EventTypeApi.new(config)
  end
  
  def list(service_id)
    self.api.list_event_types(service_id)
  end
  
  def create(service_id, event_type_data)
    self.api.createEventType(service_id, event_type_data)
  end
  
  def get(service_id, event_type_id)
    self.api.getEventType(service_id, event_type_id)
  end
  
  def delete(service_id, event_type_id)
    self.api.deleteEventType(service_id, event_type_id)
  end
end 
