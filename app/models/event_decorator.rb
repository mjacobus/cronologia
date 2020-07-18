# frozen_string_literal: true

class EventDecorator
  def initialize(event)
    @event = event
  end

  def name
    @event.name
  end

  def year
    @event.year
  end

  def precision
    @event.precision
  end

  def formatted_precision
    { 'about' => 'c.', 'after' => 'd.', 'before' => 'a.' }[precision]
  end

  def formatted_year
    if year.positive?
      return "#{year} EC"
    end

    "#{year * -1} AEC"
  end

  def to_s
    [formatted_precision, formatted_year, name].compact.join(' ')
  end

  def inline_css
    [
      "margin-left: #{margin_left}px;"
    ].join(';')
  end

  private

  def margin_left
    4050 + year
  end
end
