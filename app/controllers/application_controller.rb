class ApplicationController < ActionController::API
  include Authorization::Auth

  def render_result(service)
    return render json: service.result, status: service.status if service.success?

    render json: { error: service.error }, status: service.status
  end
end
