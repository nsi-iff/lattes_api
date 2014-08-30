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
end

RSpec.configure {|config| config.include LattesApi::Template }