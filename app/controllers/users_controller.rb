class UsersController < ApplicationController
  def create
    @users = User.create(user_params)

    if @uer.valid?
      token = encode_token({user_id: @user.id})
      render json: {user: @user, token: token}, status: :ok
    else
      render json: {error: "invalid username of password"}, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.permit(:username, :password_digest)
  end
end
