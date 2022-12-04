require 'swagger_helper'

RSpec.describe 'api/reservations', type: :request do
    path "/api/reservations" do
        post "Create a reservation" do
            tags "Reservations"
            consumes "application/json"
            parameter name: :reservations, in: :body, schema: {
                type: :object,
                properties: {
                    user_id: { type: :bigint },
                    car_id: { type: :bigint },
                    date: { type: :date },
                    city: { type: :string }
                },
                required: ["user_id", "car_id", "date", "city"],
            }
            response "201", "car has been created" do
                let(:reservations) { { user_id: 10 , car_id: 11 , date: "2022-05-23", city: "Japan" } }
                run_test!
            end
            response "422", "invalid request" do
                let(:reservations) { { user_id: 8} }
                run_test!
            end
        end
    end
end
