# frozen_string_literal: true

class Event
  attr_reader :name
  attr_reader :year
  attr_reader :precision

  def initialize(attributes = {})
    @name = attributes.fetch(:name)
    @year = Integer(attributes.fetch(:year))
    @precision = attributes.fetch(:precision)
  end
end
