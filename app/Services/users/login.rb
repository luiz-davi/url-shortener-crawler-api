# frozen_string_literal: true
module Users
  class Login < BaseService
    def call
      user = User.find_by(username: @context.username)

      if user && user.authenticate(@context.password)
        response = {
          token: encoded_token({ user_id: user.id, user_email: user.email })
        }

        return return_success(response, :ok)
      end

      return_fail('User or Password incorret.', :ok)
    end

  end
end