class ApplicationController < ActionController::Base

  include Pagy::Backend

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_total_veiculos

  def set_total_veiculos
    @total_veiculos = Veiculo.count
  end

  # Only allow modern browsers supporting webp images, web push, badges, import maps,
  # CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # Changes to the importmap will invalidate the etag for HTML responses
  stale_when_importmap_changes

  def require_admin
    unless current_user&.role == "admin"
      redirect_to root_path, alert: "Você não tem permissão para acessar esta página."
    end
  end

  protected

  def after_sign_in_path_for(resource)
    root_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  end
end