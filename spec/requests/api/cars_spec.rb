require 'swagger_helper'

RSpec.describe 'api/cars', type: :request do
  path '/api/cars' do
    post 'Create a Car' do
      tags 'Cars'
      consumes 'application/json'
      parameter name: :cars, in: :body, schema: {
        type: :object,
        properties: {
          model: { type: :string },
          color: { type: :string },
          image: { type: :string },
          price: { type: :integer },
          description: { type: :text },
          release_date: { type: :date }
        },
        required: %w[model color image price description release_date]
      }
      response '201', 'car has been created' do
        let(:cars) do
          { model: 'sedan', color: 'red', image: 'car.jpg', price: 322, desciption: 'lorem',
            release_date: '2021-11-23' }
        end
        run_test!
      end
      response '422', 'invalid request' do
        let(:cars) { { model: 'honda' } }
        run_test!
      end
    end
  end
end
