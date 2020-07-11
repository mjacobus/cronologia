# frozen_string_literal: true

module Helpers
  class TxtNormalizer
    def normalize(text)
      lines = []
      line = []

      text.split("\n").each do |content|
        if start_of_event?(content)
          lines << line.join(' ')
          line = [content]
          next
        end

        if content.strip.empty?
          next
        end

        line << content
      end

      lines << line.join(' ')

      lines.reject(&:empty?).join("\n")
    end

    private

    def start_of_event?(content)
      content.match(/^((c|d|a).\s)?\d+ A?EC/)
    end
  end
end
