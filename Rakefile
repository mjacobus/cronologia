# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'

Rails.application.load_tasks

task normalize_text_file: :environment do
  contents = File.read('spec/fixtures/events.txt')
  normalized = Helpers::TxtNormalizer.new.normalize(contents)
  File.open('spec/fixtures/events_normalized.txt', 'w') do |file|
    file.puts(normalized)
  end
end

task create_yaml_file: :environment do
  contents = File.read('spec/fixtures/events_normalized.txt')
  File.open('spec/fixtures/events.yml', 'w') do |file|
    Helpers::TxtParser.new.parse(contents).each do |event|
      event_as_string = ['-']
      event.each do |key, value|
        event_as_string << "  #{key}: \"#{value}\""
      end
      file.puts(event_as_string.join("\n"))
    end
  end
end
