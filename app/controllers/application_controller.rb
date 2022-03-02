class ApplicationController < ActionController::API
  include ActionController::Cookies

  rescue_from ActiveRecord::RecordInvalid, with: :render_invalid_response
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  private

  def render_invalid_response (invalid)
    render json: { errors: ["validation errors"] }, status: :unprocessable_entity
  end

  def render_not_found_response(error)
    render json: { error: "#{error.model} not found" }, status: :not_found
  end

end
