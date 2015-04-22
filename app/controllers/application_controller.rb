class ApplicationController < ActionController::Base

  rescue_from ActiveRecord::RecordNotFound, with: :render_404

  rescue_from ActionController::UnpermittedParameters do |e|
    render json: { message: e.message }, status: 422
  end

  protected

  def render_404
    render json: { message: 'page not found' }, status: 404
  end
end
