require_relative "../apis/message_api"

class Message
  attr_accessor :api
  
  def initialize(config)
    self.api = MessageApi.new(config)
  end
  
  def list(service_id, user_id)
    self.api.list_messages(service_id, user_id)
  end
  
  def resend(service_id, user_id, message_id)
    self.api.resend_message(service_id, user_id, message_id)
  end
  
  def get(service_id, user_id, message_id)
    self.api.get_message(service_id, user_id, message_id)
  end
end
