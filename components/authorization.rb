# require_relative "../apis/authorization_api"

# class Authorization
#   attr_accessor :api
  
#   def initialize(config)
#     self.api = AuthorizationApi.new(config)
#   end

#   def authorize_dashboard_user(service_id, user_id)
#     self.api.authorize_dashboard_user(service_id, user_id)
#   end
  
#   def logout(service_id, user_id)
#     self.api.logout_dashboard_user(service_id, user_id)
#   end
# end