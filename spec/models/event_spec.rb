# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Event do
  subject(:event) { described_class.new(attributes) }

  let(:attributes) do
    {
      name: 'the name',
      from: {
        precision: 'about',
        year: '-2'
      },
      to: {
        precision: 'about',
        year: '-2'
      }
    }
  end

  it 'has a name' do
    expect(event.name).to eq('the name')
  end

  it 'has a from.precision' do
    expect(event.from.precision).to eq('about')
  end

  it 'has a to.year' do
    expect(event.to.year).to eq(-2)
  end
end
