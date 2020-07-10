# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Event do
  subject(:event) { Event.new(name: 'the name') }

  it 'has a name' do
    expect(event.name).to eq('the name')
  end
end