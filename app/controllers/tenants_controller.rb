class TenantsController < ApplicationController
  def new
    @tenant = Tenant.new
  end

  def show
    @tenant = Tenant.find(params[:id])
    render :xml => @tenant.usage
  end

  def index
  	@tenants = Tenant.all
  end

  def create
  	@tenant = Tenant.new(:usage)
  end
end
