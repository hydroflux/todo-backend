class UsersController < ApplicationController

    before_action: 

    def create
        @user = User.new(user_params)

        if @user.valid?
            User.save(@user)
            render json: @user, status: :created
        else
            render json: { error: "Username has already been taken" }, status: :not_acceptable
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :password)
    end

end
