module Users
  class Index < BaseService
    def call
      response = User.select(:id, :username, :email, :created_at)
      return_success(response, :ok)
    end
  end
end