# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Helpers::TxtNormalizer do
  subject(:normalizer) { described_class.new }

  let(:input) do
    <<~TEXT.strip
      4026 AEC Criação de Adão Gên. 2:7

      d. 4026 AEC Feito o pacto edênico,

      primeira profecia Gên. 3:15

      a. 3896 AEC Caim mata Abel Gên. 4:8

      3896 AEC Nascimento de Sete Gên. 5:3

      3404 AEC Nascimento do justo Enoque Gên. 5:18

      3339 AEC Nascimento de Metusalém Gên. 5:21

      3152 AEC Nascimento de Lameque Gên. 5:25

      3096 AEC Morte de Adão Gên. 5:5

      3039 AEC Transferência de Enoque; Gên. 5:23, 24;

      finda seu período de Judas 14

      profetizar

      2 AEC fake 1

      2 EC fake 2

      c. 98 EC João escreve o Evangelho

      chamado “João” e suas cartas

      1, 2, e 3 João; terminada a

      escrita da Bíblia João 21:22, 23

      c. 100 EC Morre João, o último dos

      apóstolos 2 Tes. 2:7
    TEXT
  end

  let(:expected_output) do
    <<~TEXT.strip
      4026 AEC Criação de Adão Gên. 2:7
      d. 4026 AEC Feito o pacto edênico, primeira profecia Gên. 3:15
      a. 3896 AEC Caim mata Abel Gên. 4:8
      3896 AEC Nascimento de Sete Gên. 5:3
      3404 AEC Nascimento do justo Enoque Gên. 5:18
      3339 AEC Nascimento de Metusalém Gên. 5:21
      3152 AEC Nascimento de Lameque Gên. 5:25
      3096 AEC Morte de Adão Gên. 5:5
      3039 AEC Transferência de Enoque; Gên. 5:23, 24; finda seu período de Judas 14 profetizar
      2 AEC fake 1
      2 EC fake 2
      c. 98 EC João escreve o Evangelho chamado “João” e suas cartas 1, 2, e 3 João; terminada a escrita da Bíblia João 21:22, 23
      c. 100 EC Morre João, o último dos apóstolos 2 Tes. 2:7
    TEXT
  end

  it 'normalizes stream of events' do
    output = normalizer.normalize(input)

    expect(output).to eq(expected_output)
  end
end
