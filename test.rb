require "tacklebox"

tb = Tacklebox.new(
  "ZOyhHr4Czd4jZHUR4T7j0aUFhyUfIQuN6NOpFV8M",
  "https://98co0luvh2.execute-api.us-east-2.amazonaws.com"
)

service_id = "d90af763-5839-4a90-834c-5512980984f5"
user_id = "cabea1b5-b485-41b7-8146-72ece22dc458"

message = tb.message.list(service_id, user_id)

p message

# eventData := map[string]interface{}{
# 	"event_type": eventType,
# 	"payload": map[string]interface{}{
# 		"message:": "Hello from the golang wrapper!"},
# 	"idempotency_key": "8624862"}

# event := tb.Event().Create(serviceId, userId, eventData)
