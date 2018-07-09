require 'httparty'
module FormDefinitionRequest
  include HTTParty
  base_uri 'http://phoenix.typeform.com'

  def self.get_form_title(uid)
    JSON.parse(get("/form-definition/#{uid}").body)['title']
  end
end
