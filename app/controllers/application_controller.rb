class ApplicationController < ActionController::API
    before_action :authorized
    skip_before_action :authorized, only: [:login]

    # Current user allows us to see if there is a de-coded token
    # Anytime you're sending a token from your front-end to your back-end, you want to do that from your auth header

    def current_user
        @auth_header = request.headers['Authorization']
        if @auth_header
            @token = auth_header.split(" ")[1]
            # Use the begin / rescue because we don't want the entire app to break if a bad token comes back
            begin
                @user_id = JWT.decode(token, 'some secret')[0]["user_id"]
                # when we 'encode' we're using user_id, so we're grabbing user_id when we decode as well
            rescue JWT::DecodeError
                nil
            end
        end
        @user = User.find(@user_id)
    end

    def logged_in?
        # Double-bang turns into a boolean (making it truthy or falsey)
        !!current_user
    end

    def authorized
        render json: {message: "Please Log In"}, status: :unauthorized unless logged_in?
    end

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
