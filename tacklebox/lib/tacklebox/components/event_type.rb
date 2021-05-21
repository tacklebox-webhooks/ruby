require_relative "../apis/event_type_api"

class EventType
  attr_accessor :api
  
  def initialize(config)
    self.api = EventTypeApi.new(config)
  end
  
  def list(service_id)
    self.api.list_event_types(service_id)
  end
  
  def create(service_id, event_typeData)
    self.api.createEventType(service_id, event_typeData)
  end
  
  def get(service_id, event_typeId)
    self.api.getEventType(service_id, event_typeId)
  end
  
  # async def delete(service_id, event_typeId)
  #   self.api.deleteEventType(service_id, event_typeId)
  # end
end 
