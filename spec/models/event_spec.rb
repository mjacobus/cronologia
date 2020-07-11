# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Event do
  subject(:event) { described_class.new(attributes) }

  let(:attributes) do
    {
      name: 'the name',
      precision: 'about',
      year: '-2'
    }
  end

  it 'has a name' do
    expect(event.name).to eq('the name')
  end

  it 'has a precision' do
    expect(event.precision).to eq('about')
  end

  it 'has a year' do
    expect(event.year).to eq(-2)
  end
end
