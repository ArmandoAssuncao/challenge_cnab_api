class ApplicationController < ActionController::API
  include Response
  include ExceptionHandler

  ActionController::Parameters.action_on_unpermitted_parameters = :raise

  def routing_error
    raise ActionController::RoutingError, params[:path]
  end
end
