class UsersController < ApplicationController
    skip_before_action :authorized, only: [:create]

    def profile
        render json: { user: current_user, to_dos: current_user.to_dos }
    end

    def create
        @user = User.new(user_params)

        if @user.valid?
            @user.save
            @token = JWT.encode({ user_id: @user.id }, "some_secret" )
            render json: { user: @user, token: @token, to_dos: @user.to_dos }, status: :created
        else
            render json: { errors: @user.errors.full_messages }, status: :not_acceptable
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :password)
    end

end
