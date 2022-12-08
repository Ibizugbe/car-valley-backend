class UsersController < ApplicationController
  before_action :authorize, except: %i[create login]

  def create
    user = User.create(user_params)

    if user.valid?
      render json: { user:, status: 'success' }, status: :ok
    else
      render json: { error: user.errors.full_messages, status: 'failure' }, status: :unprocessable_entity
    end
  end

  def login
    user = User.find_by(username: params[:username])
    if user
      if user.authenticate(params[:password])
        token = encode_token({ user_id: user.id })
        render json: { user:, token:, status: 'success' }, status: 200,
               except: %i[password_digest created_at updated_at]
      else
        render json: { error: 'Invalid Password', status: 'failure' }, status: :unauthorized
      end
    else
      render json: { error: 'User not found', status: 'failure' }, status: :unauthorized
    end
  end

  def show
    @user = User.find(params[:id])
    render json: @user, include: :reservations
  end

  private

  def user_params
    params.permit(:username, :first_name, :last_name, :dob, :password)
  end
end
