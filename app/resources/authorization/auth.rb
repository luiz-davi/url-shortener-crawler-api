module Authorization
  module Auth
    extend ActiveSupport::Concern

    public def encoded_token(payload)
      JWT.encode(payload, ENV['JWT_SECRET_KEY'], ENV['JWT_ALGORITHM'])
    end

    public def decode_token
      token_header = request.headers['authorization']

      return nil unless token_header

      token = token_header.split(' ').last

      begin
        return JWT.decode(token, ENV['JWT_SECRET_KEY'], true, { algorithm: ENV['JWT_ALGORITHM'] })
      rescue => error
        render json: { error: error.message }, status: :unauthorized
      end

    end

    public def authorize
      decoded_token = decode_token

      if decoded_token
        user_id = decoded_token[0]['user_id']
        @user = User.find_by(id: user_id)
      else
        @user = nil
      end
    end
  end
end