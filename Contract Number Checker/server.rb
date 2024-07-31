require 'sinatra'
require 'json'

# Set up the public folder to serve static files (HTML, CSS, JS)
set :public_folder, File.dirname(__FILE__)

post '/check_contract' do
  request.body.rewind
  request_payload = JSON.parse(request.body.read)
  contract_number = request_payload['contract_number']

  # Example: Simulate contract number validation
  if contract_number == "12345"
    message = "Contract number #{contract_number} is valid!"
  else
    message = "Contract number #{contract_number} is not valid."
  end

  content_type :json
  { message: message }.to_json
end

# Start the server
if __FILE__ == $0
  Sinatra::Application.run!
end
