require './lib/lattes_api'

Dir[File.join(File.dirname(__FILE__), 'support', '**', '*.rb')].each do |f|
  require f
end

RSpec.configure do |config|

end