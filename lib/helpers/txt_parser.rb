# frozen_string_literal: true

module Helpers
  class TxtParser
    def parse(text)
      text.split("\n").map do |line|
        parse_line(line)
      end
    end

    private

    def parse_line(line)
      time = {
        year: year(line),
        month: month(line),
        day: day(line),
        precision: precision(line)
      }
      {
        name: name(line),
        from: time.dup,
        to: time.dup
      }.compact
    end

    def name(line)
      line.split('EC').last.strip
    end

    def year(line)
      y = line.match(/\d+/).to_a.first.to_i

      if line.split(y.to_s).last.strip.split(' ').first.casecmp('aec').zero?
        y *= -1
      end

      y
    end

    def month(_line)
      nil
    end

    def day(_line)
      nil
    end

    def precision(line)
      line = line.downcase

      if line.starts_with?('c.')
        return 'about'
      end

      if line.starts_with?('d.')
        return 'after'
      end

      if line.starts_with?('a.')
        return 'before'
      end

      'precise'
    end
  end
end
