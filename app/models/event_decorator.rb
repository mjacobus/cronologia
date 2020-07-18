# frozen_string_literal: true

class EventDecorator
  def initialize(event)
    @event = event
  end

  def name
    @event.name
  end

  def from
    @event.from
  end

  def to
    @event.to
  end

  def to_s
    parts = [from.to_s]

    if lengthy?
      parts << [' - ', to.to_s]
    end

    parts << ": #{name}"
    parts.compact.join
  end

  def inline_css
    css = ["margin-left: #{margin_left}px;"]

    if lengthy?
      css << ["width: #{length_in_years}px;"]
    end

    css.join(';')
  end

  def css_classes
    classes = []

    if length_in_years.positive?
      classes << 'long-event'
    end

    classes.join(' ')
  end

  def lengthy?
    length_in_years.positive?
  end

  def length_in_years
    # TODO: Chek how year zero impacts it
    to.year - from.year
  end

  private

  def margin_left
    4100 + from.year
  end
end
