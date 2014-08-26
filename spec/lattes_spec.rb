require 'spec_helper'

describe LattesApi do
  it 'check version' do
    expect(LattesApi::VERSION).to eq '0.0.1'
  end
end