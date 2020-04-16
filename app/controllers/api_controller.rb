class ApiController < ApplicationController
  include ExecuteHelper
  skip_before_action :verify_authenticity_token
  def submit
    if params[:id]==nil||params[:input]==nil
      render json: {error: 'wrong params'}, status: :bad_request
    else
      code = Code.find(params[:id])
      submission = execute(code.info,params[:input])
      render json: {output: submission[:output], status: submission[:status]}, status: :ok
    end
  end
end
