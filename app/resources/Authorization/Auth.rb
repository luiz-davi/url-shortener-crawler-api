module Authorization
  module Auth
    extend ActiveSupport::Concern

    public def encoded_token(payload)
      JWT.encode(payload, 'secret', 'HS256')
    end

    public def decode_token
      token_header = request.headers['Authorization']

      return render json: { error: 'Jwt token is required.' }, status: :unauthorized unless token_header

      token = token_header.split(' ').last

      begin
        return JWT.decode(token, 'secret', true, { algorithm: 'HS256' })
      rescue => error
        render json: { error: error.message }, status: :unauthorized
      end

    end

    public def authorize
      decoded_token = decode_token

      if decoded_token
        user_id = decoded_token[0]['user_id']
        @user = User.find_by(id: user_id)
      end
    end
  end
end