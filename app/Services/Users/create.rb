# frozen_string_literal: true

module Users
  class Create < BaseService
    def call
      user = User.create(
        username: @context.username,
        email: @context.email,
        password: @context.password,
      )

      if user.valid?
        response = {
          user: user,
          token: encoded_token({ user_id: user.id, user_email: user.email })
        }

        return return_success(response, :created)
      end

      return_fail(user.errors.messages, :unprocessable_entity)
    end
  end
end
