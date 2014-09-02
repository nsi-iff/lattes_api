require 'spec_helper'

describe LattesApi do
  before(:all) { savon.mock! }
  after(:all) { savon.unmock! }

  let(:id_cnpq) { '1234567890123456' }
  let(:cpf) { '123.456.789-09' }

  it 'check version' do
    expect(LattesApi::VERSION).to eq '0.0.1'
  end

  describe 'getIdentificadorCNPq(cpf)' do
    let(:message) do
      { cpf: cpf, nomeCompleto: nil, dataNascimento: nil }
    end

    it 'happy path' do
      savon.expects(:get_identificador_cn_pq).with(message: message).returns(
        response(:get_identificador_cnpq, id_cnpq))
      client = LattesApi::Client.new
      expect(client.get_identificador_cnpq(cpf)).to eq id_cnpq
    end

    it 'access denied' do
      savon.expects(:get_identificador_cn_pq).
        with(message: message).
        returns(access_denied('getIdentificadorCNPq'))
      client = LattesApi::Client.new
      expect {
        client.get_identificador_cnpq(cpf)
      }.to raise_error LattesApi::AccessDenied
    end
  end

  describe 'getCurriculoCompactado(id)' do
    let(:message) { { id: id_cnpq } }

    it 'happy path' do
      result = encodeFile(id_cnpq)
      savon.expects(:get_curriculo_compactado).with(message: message).returns(
        response(:get_curriculo_compactado, result))
      client = LattesApi::Client.new
      expect(client.get_curriculo_compactado(id_cnpq)).to eq result
    end

    it 'access denied' do
      savon.expects(:get_curriculo_compactado).
        with(message: message).
        returns(access_denied('getCurriculoCompactado'))
      client = LattesApi::Client.new
      expect {
        client.get_curriculo_compactado(id_cnpq)
      }.to raise_error LattesApi::AccessDenied
    end
  end
end
