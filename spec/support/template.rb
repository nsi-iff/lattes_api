require 'base64'

module LattesApi::Template
  def response(operation, return_value)
    content = File.read("spec/resources/#{operation}_template.xml")
    content['$$value$$'] = return_value
    content
  end

  def encodeFile(return_value)
      Base64.encode64(File.open(
        "spec/resources/#{return_value}_test.zip", 'rb') { |io| io.read })
  end

  def access_denied(operation)
    File.read('spec/resources/access_denied.xml').gsub('$$value$$', operation)
  end
end

RSpec.configure {|config| config.include LattesApi::Template }
