class BaseService
  include Interactor

  def return_success(response, status)
    @context.result = response
    @context.status = status
  end

  def return_fail(error, status)
    @context.error = error
    @context.status = status
    @context.fail!
  end

  def encoded_token(payload)
    JWT.encode(payload, 'secret', 'HS256')
  end
end