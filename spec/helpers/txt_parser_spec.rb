# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Helpers::TxtParser do
  let(:parsed) { described_class.new.parse(input) }
  let(:input) do
    <<~TEXT.strip
      4026 AEC event 1
      d. 4026 AEC event 2
      a. 3896 AEC event 3
      3896 AEC event 4
      2 AEC fake 1
      2 EC fake 2
      c. 98 EC event 6
      c. 100 EC event 7
    TEXT
  end

  it 'parses precision correctly' do
    expect(collect(:precision)).to eq([
      'precise', # 4026 AEC event 1
      'after',   # d. 4026 AEC event 2
      'before',  # a. 3896 AEC event 3
      'precise', # 3896 AEC event 4
      'precise', # 2 AEC fake 1
      'precise', # 2 EC fake 2
      'about',   # c. 98 EC event 6
      'about',   # c. 100 EC event 7
    ])
  end

  it 'parses year correctly' do
    expect(collect(:year)).to eq([
      -4026, # 4026 AEC event 1
      -4026, # d. 4026 AEC event 2
      -3896, # a. 3896 AEC event 3
      -3896, # 3896 AEC event 4
      -2,    # 2 AEC fake 1
      2,     # 2 EC fake 2
      98,    # c. 98 EC event 6
      100,   # c. 100 EC event 7
    ])
  end

  it 'parses name correctly' do
    expect(collect(:name)).to eq([
      'event 1', # 4026 AEC event 1
      'event 2', # d. 4026 AEC event 2
      'event 3', # a. 3896 AEC event 3
      'event 4', # 3896 AEC event 4
      'fake 1',  # 2 AEC fake 1
      'fake 2',  # 2 EC fake 2
      'event 6', # c. 98 EC event 6
      'event 7', # c. 100 EC event 7
    ])
  end

  def collect(key)
    parsed.map { |item| item[key] }
  end
end
