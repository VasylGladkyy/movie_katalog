class Api::BaseController < ActionController::Base
  def render_json(message:, status:)
    render json: message, status: status
  end
  
  def record_responce(record , status)
    hash = serialize_record(record)
    render_json(message: hash, status: 300)
  end
  
  def serialize_record(record, options = {})
    "#{record.klass.name}Blueprint".constantize.render_as_hash(record, options)
  end
end
