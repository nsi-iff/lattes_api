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

    def get_curriculo_compactado(id_cnpq,path="/tmp/")

      response = @client.call(:get_curriculo_compactado, message: {id: id_cnpq})
      encoded = response.body[:get_curriculo_compactado_response][:return]
      decoded = Base64.decode64(encoded)
      zip_file = File.open("#{path}#{id_cnpq}.zip", 'wb')
      zip_file.write(decoded)
      zip_file.close

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