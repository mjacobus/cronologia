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
      return "#{year} EC #{formatted_precision}".strip
    end

    "#{year * -1} AEC #{formatted_precision}".strip
  end

  private

  def formatted_precision
    value = { 'about' => 'c.', 'after' => 'd.', 'before' => 'a.' }[precision]
    if value
      "(#{value})"
    end
  end
end
