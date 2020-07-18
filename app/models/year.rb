# frozen_string_literal: true

class Year
  def initialize(number)
    @number = number
  end

  def to_i
    Integer(@number)
  end

  def to_s
    if to_i.positive?
      return "#{to_i} EC"
    end

    "#{to_i * -1} AEC"
  end
end
