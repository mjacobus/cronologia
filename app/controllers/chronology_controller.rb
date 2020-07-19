# frozen_string_literal: true

class ChronologyController < ApplicationController
  def index
    @timeline = TimelineFactory.new.create
  end

  def timeline
    @timeline = TimelineFactory.new.create
  end
end
