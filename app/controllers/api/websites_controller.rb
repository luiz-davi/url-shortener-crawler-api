class Api::WebsitesController < ApplicationController

  def index
    service = Websites::Index.call

    render_result(service)
  end

end
