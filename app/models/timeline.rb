# frozen_string_literal: true

class Timeline
  include Enumerable

  def initialize(events)
    @events = events
  end

  def each(&block)
    @events.each(&block)
  end

  def self.from_yaml_file(file = Rails.root.join('config/timeline.yml'))
    result = YAML.load_file(file).deep_symbolize_keys
    events = result[:events].map do |event|
      Event.new(event)
    end
    new(events)
  end
end
