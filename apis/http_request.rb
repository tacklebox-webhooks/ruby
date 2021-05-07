class HttpRequest
  attr_accessor :method, :base_url, :path, :data, :attempt
  
  def initialize(method, base_url, path = nil, data = nil)
    self.attempt = 1
    self.method = method
    self.base_url = base_url
    self.path = path
    
    if data && data['event_types']
      data['eventTypes'] = data['event_types']
      data.delete('event_types')
    end
    
    self.data = data
  end
end
