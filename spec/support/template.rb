module LattesApi::Template
  def response(operation, return_value)
    content = File.read("spec/resources/#{operation}_template.xml")
    content['$$value$$'] = return_value
    content
  end
end

RSpec.configure {|config| config.include LattesApi::Template }