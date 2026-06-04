class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.html { redirect_to root_url, alert: "No tienes permiso para realizar esta acción" }
      format.json { render json: { error: "No autorizado" }, status: :forbidden }
    end
  end
end
