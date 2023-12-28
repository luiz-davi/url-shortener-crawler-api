module Users
  class Index < BaseService
    def call
      return_success(User.all, :ok)
    end
  end
end