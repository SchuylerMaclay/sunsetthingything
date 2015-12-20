require_relative '../config/environment'

# require 'webmock/rspec'  
# WebMock.disable_net_connect!(allow_localhost: true)  

RSpec.configure do |config|
  config.order = 'default'
end

def capture_puts
  begin
    old_stdout = $stdout
    $stdout = StringIO.new('','w')
    yield
    $stdout.string
  ensure
    $stdout = old_stdout
  end
end

def run_file(file)
  eval(File.read(file), binding)
end
