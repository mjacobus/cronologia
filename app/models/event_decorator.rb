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
    { 'about'  => 'c.', 'after' => 'd.', 'before' => 'a.' }[precision]
  end

  def formatted_year
    if year.positive?
      return "#{year} EC"
    end

    "#{year * -1} EC"
  end

  def to_s
    [formatted_precision, formatted_year, name].compact.join(' ')
  end
end
