require 'swagger_helper'

RSpec.describe 'api/users', type: :request do
    path "/api/users" do
        post "Create a user" do
            tags "Users"
            consumes "application/json"
            parameter name: :users, in: :body, schema: {
                type: :object,
                properties: {
                    username: { type: :string },
                    password: { type: :string },
                    first_name: { type: :string },
                    last_name: { type: :string },
                    dob: { type: :date }
                },
                required: ["username", "password", "first_name", "last_name", "dob"],
            }
            response "201", "user has been created" do
                let(:users) { { username: "Smith" , password: 11 , first_name: "abraham", last_name: "ibizugbe", dob: "2022-05-23"} }
                run_test!
            end
            response "422", "invalid request" do
                let(:users) { { password: "12"} }
                run_test!
            end
        end
    end

    path '/api//users/{id}' do

        get 'Retrieves a user' do
            tags 'Users', 'Another Tag'
            produces 'application/json', 'application/xml'
            parameter name: :id, in: :path, type: :string
            request_body_example value: { some_field: 'Foo' }, name: 'basic', summary: 'Request example description'
    
            response '200', 'user found' do
                schema type: :object,
                properties: {
                    username: { type: :integer },
                    password: { type: :string },
                    first_name: { type: :string },
                    last_name: {  type: :string},
                    dob: { type: :date }
                },
                required: ["username", "password", "first_name", "last_name", "dob"]
        
                let(:id) { User.create(username: "Smith" , password: 11 , first_name: "abraham", last_name: "ibizugbe", dob: "2022-05-23").id }
                run_test!
            end
        
            response '404', 'user not found' do
                let(:id) { 'invalid' }
                run_test!
            end

            response '406', 'unsupported accept header' do
                let(:'Accept') { 'application/foo' }
                run_test!
            end
        end
    end
end
