class ApplicationController < ActionController::Base
  before_action :authenticate_tenant!   # authenticate user and sets up tenant
  protect_from_forgery with: :exception


     ##    milia defines a default max_tenants, invalid_tenant exception handling
     ##    but you can override these if you wish to handle directly
  rescue_from ::Milia::Control::MaxTenantExceeded, :with => :max_tenants
  rescue_from ::Milia::Control::InvalidTenantAccess, :with => :invalid_tenant


  def set_tenant
    @tenant = Tenant.find(params[:tenant_id])
  end

  def verify_tenant
    unless params[:tenant_id] == Tenant.current_tenant_id.to_s
      redirect_to :root, flash: { error: 'Você não possui permissão'}
    end
  end
end
