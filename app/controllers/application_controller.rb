class ApplicationController < ActionController::API

    def login
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate( params[:password] )
            @token = JWT.encode({user_id: @user.id}, "some secret")
            render json: { user: @user, token: @token, to_dos: @user.to_dos}, status: :accepted
        else
            render json: { errors: "Invalid username or password."}, status: :unauthorized
        end
    end

end
