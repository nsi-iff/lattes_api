require 'savon'
require 'base64'
require 'zip'

module LattesApi
  class Client
    def initialize
      @client = Savon.client(wsdl: wsdl, endpoint: endpoint)
    end

    def get_identificador_cnpq(cpf)
      response = @client.call(:get_identificador_cn_pq, message: { cpf: cpf,
        nomeCompleto: nil, dataNascimento: nil })
      response.body[:get_identificador_cn_pq_response][:return]
    end

    def get_curriculo_compactado(id_cnpq)
      response = @client.call(:get_curriculo_compactado, message: {id: id_cnpq})
      response.body[:get_curriculo_compactado_response][:return]
    end

    private

    def endpoint
      'http://servicosweb.cnpq.br/srvcurriculo/WSCurriculo'
    end

    def wsdl
      "#{endpoint}?wsdl"
    end
  end
end