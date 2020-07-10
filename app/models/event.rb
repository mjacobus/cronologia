# frozen_string_literal: true

class Event
  attr_reader :name

  def initialize(attributes = {})
    @name = attributes.fetch(:name)
  end
end
