require_relative "../apis/user_api"

class User
  attr_accessor :api
  
  def initialize(config)
    self.api = UserApi.new(config)
  end
  
  def list(service_id)
    self.api.list_users(service_id)
  end
  
  def create(service_id, userData)
    self.api.create_user(service_id, userData)
  end
  
  def get(service_id, user_id)
    self.api.get_user(service_id, user_id)
  end
  
  # def delete(service_id, user_id)
  #   self.api.delete_user(service_id, user_id)
  # end
end
