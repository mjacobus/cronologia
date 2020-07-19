# frozen_string_literal: true

class Timeline
  include Enumerable

  def initialize(events)
    @events = events
  end

  def each(&block)
    @events.each(&block)
  end
end
