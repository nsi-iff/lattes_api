require 'spec_helper'

describe LattesApi do

  before(:all) { savon.mock! }
  after(:all) { savon.unmock! }


  it 'check version' do
    expect(LattesApi::VERSION).to eq '0.0.1'
  end

  it 'getIdentificadorCNPq(cpf)' do
    cpf = '123.456.789-09'
    id_cnpq = '1234567890123456'
    message = { cpf: cpf, nomeCompleto: nil, dataNascimento: nil }
    savon.expects(:get_identificador_cn_pq).with(message: message).returns(
      response(:get_identificador_cnpq, id_cnpq))
    client = LattesApi::Client.new
    expect(client.get_identificador_cnpq(cpf)).to eq id_cnpq
  end

  it 'getCurriculoCompactado(id,path)' do

    id_cnpq = '1234567890123456'
    path    = "spec/resources/"
    message = { id: id_cnpq }
    savon.expects(:get_curriculo_compactado).with(message: message).returns(
      response(:get_curriculo_compactado, encodeFile(id_cnpq)))
    client = LattesApi::Client.new
    client.get_curriculo_compactado(id_cnpq,path)
    expect(Pathname.new("#{path}#{id_cnpq}.zip")).to exist

  end

end