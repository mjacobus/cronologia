# frozen_string_literal: true

class TimelineFactory
  def create
    events = configuration_files.map do |file|
      file = Rails.root.join(file)
      config = YAML.load_file(file).deep_symbolize_keys
      create_from_config(config)
    end
    events.flatten.sort_by { |event| event.from.year }
  end

  private

  def configuration_files
    Dir["#{Rails.root.join('config/timeline')}/*.yml"]
  end

  def create_from_config(config)
    config[:events].map do |event|
      event[:tags] = [event[:tags], config[:tags]].flatten.compact.uniq
      Event.new(event)
    end
  end
end
