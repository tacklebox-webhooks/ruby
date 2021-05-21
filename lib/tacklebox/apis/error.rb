def new_error(error_type, detail)
  {
    Error: {
      error_type: error_type,
      detail: detail,
    },
  }
end

ERROR_TYPES = {
  "missing_parameter" => "missing_parameter",
  "max_retries_reached" => "max_retries_reached",
}

module Validation
  def is_valid_id(id)
    id && id.class == String
  end
  
  def is_valid_data(data)
    !!data
  end
  
  def is_valid_name(data)
    data['name'] && data['name'].class == String
  end
  
  def is_valid_subscription_data(data)
    (
      data['url'] &&
      data['url'].class == String &&
      data['event_types'] &&
      data['event_types'].length > 0
    )
  end
  
  def is_valid_event_data(data)
    (
      data['event_type'] &&
      data['event_type'].class == String &&
      data['idempotency_key'] &&
      data['idempotency_key'].class == String &&
      data['payload']
    )
  end
end
