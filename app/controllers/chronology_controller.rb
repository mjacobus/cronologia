# frozen_string_literal: true

class ChronologyController < ApplicationController
  def index
    @timeline = Timeline.from_yaml_file
  end
end
