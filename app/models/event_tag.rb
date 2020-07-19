# frozen_string_literal: true

class EventTag
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def to_s
    name
  end

  def to_param
    name.split(' ').join('-').downcase
  end
end
