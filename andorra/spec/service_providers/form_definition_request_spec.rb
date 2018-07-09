require_relative '../../form_definition_request.rb'
require_relative 'pact_helper.rb'

describe(FormDefinitionRequest, pact: true) do
  before do
    FormDefinitionRequest.base_uri('localhost:1234')
    phoenix.upon_receiving('A form definition request')
           .with(method: :get, path: '/form-definition/abcdef', query: '')
           .will_respond_with(
             status: 200,
             headers: { 'Content-Type' => 'application/json' },
             body: { 
               ref: 'nice_readable_dropdown_reference',
               title: 'Dropdown Title',
               type: 'dropdown',
               properties: {
                 description: 'Cool description for the dropdown',
                 alphabetical_order: false,
                 choices: [
                   {
                     label: 'Foo'
                   },
                   {
                     label: 'Bar'
                   }
                 ]
               },
               validations: {
                 required: false
               },
               attachment: {
                 type: 'image',
                 href: 'https://images.typeform.com/images/4bcd3'
               }
             }
           )
  end

  it('returns a form definition title') do 
    expect(FormDefinitionRequest.get_form_title('abcdef')).to eq('Dropdown Title')
  end
end
