# frozen_string_literal: true

class Api::BaseController < ActionController::Base
  def record_responce(record, status = 300)
    hash = serialize_record(record)
    render_json(message: hash, status: status)
  end

  private

  def render_json(message:, status:)
    render json: message, status: status
  end

  def serialize_record(record, options = {})
    "#{class_name(record: record)}Blueprint".constantize.render_as_hash(record, options)
  end

  def class_name(record:)
    record_class_name = record.class.name
    record_class_name == 'ActiveRecord::Relation' ? record.klass.name : record_class_name
  end
end
