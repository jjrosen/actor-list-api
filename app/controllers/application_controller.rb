class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  protect_from_forgery with: :exception, unless: -> { request.format.json? }

  helper_method :current_user

  def current_user
    User.find_by(id: cookies.signed[:user_id])
  end

  def authenticate_user
    unless current_user
      render json: {}, status: :unauthorized
    end
  end

  def authenticate_admin
    unless current_user && current_user.admin
      render json: {error: "Unauthorized - must be an admin"}, status: :unauthorized
    end
  end

  def authorize_post_owner
    actor= Actor.find(params[:id])
    unless current_user.admin || actor.user_id == current_user.id
      render json: {error: "You don't have permission to modify this Actor"}
    end
  end
end
