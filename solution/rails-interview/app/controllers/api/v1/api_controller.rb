module Api::V1
  class ApiController < ApplicationController 
    include ErrorResponse

    protect_from_forgery with: :null_session

    before_action :authenticate_tenant_from_token 
    before_action :increase_api_quota

    respond_to :json

    private
    def increase_api_quota
      current_tenant.increment!(:request_count)
    end

    def current_tenant
      access_token = request.headers["HTTP_AUTHORIZATION"]
      api_key = ApiKey.find_by(access_token: access_token)
      api_key.tenant if api_key
    end

    def authenticate_tenant_from_token
      render_unauthorized unless current_tenant
    end
  end
end