class UsersController < ApplicationController
  before_action :authorize, except: [:create, :login]

  def create
    @user = User.create(user_params)

    if @user.valid?
      token = encode_token({ user_id: @user.id })
      render json: { user: @user, token: }, status: :ok
    else
      render json: { error: 'invalid username or password' }, status: :unprocessable_entity
    end
  end

  def login
    user = User.find_by(username: params[:username])
    if user
      if user.authenticate(params[:password])
        token = encode_token({ user_id: user.id })
        render json: { user: user, token: token, status: "success" }, status: 200, except: [:password_digest, :created_at, :updated_at]
      else
        render json: { error: "Invalid Password", status: "failure" }, status: :unauthorized
      end
    else
      render json: { error: "User not found", status: "failure" }, status: :unauthorized
    end
  end

  def show
    @user = User.find(params[:id])
    render json: @user, include: :reservations
  end

  private

  def user_params
    params.permit(:username, :password)
  end
end
