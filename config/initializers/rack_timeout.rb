# config/initializers/rack_timeout.rb

begin
  Rack::Timeout.timeout = 120
rescue
end
