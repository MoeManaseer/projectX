class ApiController < ApplicationController
  include ExecuteHelper
  skip_before_action :verify_authenticity_token
  def submit
    logger.error { params}
    logger.error { Parameters}
      code = Code.find(Parameters[:id])
      submission = execute(code.info,params[:input])
      @testsub = Testsub.new(code_id: code.id, input: params[:input], output: submission[:output])
      @testsub.save
      render json: submission[:output], status: :ok
  end
end
