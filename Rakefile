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
