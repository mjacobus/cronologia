# frozen_string_literal: true

class TimelineFactory
  def create
    events = configuration_files.map do |file|
      file = Rails.root.join(file)
      result = YAML.load_file(file).deep_symbolize_keys
      create_from_config(result)
    end
    events.flatten.sort_by { |event| event.from.year }
  end

  private

  def configuration_files
    Dir["#{Rails.root.join('config/timeline')}/*.yml"]
  end

  def create_from_config(result)
    result[:events].map do |event|
      Event.new(event)
    end
  end
end
