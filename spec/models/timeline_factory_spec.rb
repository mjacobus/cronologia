# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TimelineFactory do
  describe '#create' do
    let(:timeline) { described_class.new.create }

    it 'creates from yaml events' do
      event = timeline.first

      expect(event.name).to eq('Adão')
      expect(event.from.year).to eq(-4026)
      expect(event.from.precision).to eq('precise')
      expect(event.to.year).to eq(-3096)
      expect(event.to.precision).to eq('precise')

      expect(event.description_lines).to include('Criação de Adão Gên. 2:7')
      expect(event.description_lines).to include('Morte de Adão Gên. 5:5')
    end
  end
end
