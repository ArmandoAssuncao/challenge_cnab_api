module ExceptionHandler
  extend ActiveSupport::Concern

  class InvalidToken < StandardError; end
  class InvalidParameter < StandardError; end
  class MissingToken < StandardError; end

  included do
    # rescue_from StandardError, with: :render_unprocessable_entity
    # rescue_from ActiveModel::ValidationError, with: :render_bad_request
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity
    rescue_from ActionController::RoutingError, with: :render_bad_request
    rescue_from ActionController::ParameterMissing, with: :render_bad_request
    rescue_from ActionController::UnpermittedParameters, with: :render_bad_request

    rescue_from ExceptionHandler::InvalidToken, with: :render_unprocessable_entity
    rescue_from ExceptionHandler::InvalidParameter, with: :render_bad_request
    rescue_from ExceptionHandler::MissingToken, with: :render_unprocessable_entity
  end

  private

  # Status code 400 - bad request
  def render_bad_request(error)
    json_response({ error: { message: error.message } }, :bad_request)
  end

  # Status code 404 - not found
  def render_not_found(error)
    json_response({ error: { message: error.message } }, :not_found)
  end

  # Status code 422 - unprocessable entity
  def render_unprocessable_entity(error)
    json_response({ error: { message: error.message } }, :unprocessable_entity)
  end
end
