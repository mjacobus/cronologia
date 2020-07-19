# frozen_string_literal: true

class Event
  attr_reader :name
  attr_reader :from
  attr_reader :to
  attr_reader :description_lines

  def initialize(attributes = {})
    @name = attributes.fetch(:name)
    @from = EventDate.new(attributes.fetch(:from))
    @to = EventDate.new(attributes.fetch(:to))
    @description_lines = attributes.fetch(:description_lines, [])
    @todos = attributes.fetch(:todos, [])
  end

  def pending_checks?
    @todos.any?
  end
end
