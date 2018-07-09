#this is the phoenix mock server in andorra.

require 'pact/consumer/rspec'

Pact.service_consumer "Andorra" do
  has_pact_with("Phoenix") do
    mock_service :phoenix do
      port 1234
    end
  end
end