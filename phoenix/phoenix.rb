
    require 'sinatra'
    require 'json'
class Phoenix < Sinatra::Base
    get '/form-definition/*' do
      content_type :json
      { 
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
      }.to_json
    end
  end