require 'pact/provider/rspec'

Pact.service_provider('Phoenix') do
  honours_pact_with('Andorra') do
    pact_uri('http://localhost:8080/pacts/provider/Phoenix/consumer/Andorra/latest')
  end
end