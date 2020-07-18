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
      return "#{formatted_precision} #{year} EC"
    end

    "#{formatted_precision} #{year * -1} AEC"
  end

  private

  def formatted_precision
    { 'about' => 'c.', 'after' => 'd.', 'before' => 'a.' }[precision]
  end
end
