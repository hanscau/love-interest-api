class ApplicationController < ActionController::API
    before_action :authorized

    def encode_token(payload)
        JWT.encode(payload, 'secr333ttt')
    end 

    def decoded_token
        header = request.headers['Authorization']
        if header 
            token = header.split(' ')[1]
            begin
                JWT.decode(token, 'secr333ttt', true, algorithm: 'HS256')
            rescue JWT::DecodeError
                nil
            end
        end
    end

    def current_user
        if decoded_token
            user_id = decoded_token[0]['user_id']
            @user = User.find_by(id: user_id)
        end 
    end 

    def authorized
        unless !!current_user
            render json: { message: 'Not logged in!!' }, status: :unauthorized
        end
    end
end
