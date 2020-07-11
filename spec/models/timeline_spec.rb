# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Timeline do
  describe '#from_yaml_file' do
    let(:timeline) { described_class.from_yaml_file }

    it 'creates from yaml events' do
      event = timeline.first

      expect(event.name).to eq('Criação de Adão Gên. 2:7')
      expect(event.year).to eq(-4026)
      expect(event.precision).to eq('precise')
    end
  end
end
