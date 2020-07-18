# frozen_string_literal: true

class EventDate
  attr_reader :year
  attr_reader :precision

  def initialize(attributes)
    @year = Integer(attributes.fetch(:year))
    @precision = attributes.fetch(:precision)
  end

  def to_s
    if year.positive?
      return "#{year} EC"
    end

    "#{year * -1} AEC"
  end

  def formatted_precision
    { 'about' => 'c.', 'after' => 'd.', 'before' => 'a.' }[precision]
  end
end
