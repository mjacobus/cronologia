# frozen_string_literal: true

class Event
  attr_reader :name
  attr_reader :from
  attr_reader :to
  attr_reader :description_lines
  attr_reader :tags

  def initialize(attributes = {})
    @name = attributes.fetch(:name)
    @from = EventDate.new(attributes.fetch(:from))
    @to = EventDate.new(attributes.fetch(:to))
    @description_lines = attributes.fetch(:description_lines, [])
    @todos = attributes.fetch(:todos, [])
    @tags = attributes.fetch(:tags, []).map do |tag|
      EventTag.new(tag)
    end
  end

  def pending_checks?
    @todos.any?
  end
end
