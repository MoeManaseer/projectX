class ApiController < ApplicationController
  include ExecuteHelper
  skip_before_action :verify_authenticity_token
  def submit
      code = Code.find(params[:id])
      submission = execute(code.info,params[:input])
      render json: submission[:output], status: :ok
  end
end
