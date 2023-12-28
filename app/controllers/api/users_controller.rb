module Api
  class UsersController < ApplicationController
    before_action :authorize, only: %i[index]

    def index
      service = Users::Index.call

      render_result(service)
    end

    def create
      service = Users::Create.call(user_params)

      render_result(service)
    end

    def login
      service = Users::Login.call(user_params)

      render_result(service)
    end

    private

    def user_params
      params.permit(:username, :password, :email)
    end
  end
end
