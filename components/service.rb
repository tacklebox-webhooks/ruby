require_relative "../apis/service_api"

class Service
  attr_accessor :api
  
  def initialize(config)
    self.api = ServiceApi.new(config)
  end
  
  def list
    self.api.list_services()
  end
  
  def create(serviceData)
    self.api.create_service(serviceData)
  end
  
  def get(service_id)
    self.api.get_service(service_id)
  end
  
  #  def delete(service_id)
  #    self.api.delete_service(service_id)
  # end
end
