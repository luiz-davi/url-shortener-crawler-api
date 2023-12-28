# frozen_string_literal: true
module Websites
  class Index < BaseService
    def call
      response = Website.select('id, name, link')
      return_success(response, :ok)
    end
  end
end
