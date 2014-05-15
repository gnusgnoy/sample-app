class TenantsController < ApplicationController
  def new
    @tenant = Tenant.new
  end

  def show
    @tenant = Tenant.find(params[:id])
    unless @tenant.usage.nil?
      render :xml => @tenant.usage
    else
      render :show
    end
    #render nothing: true
  end

  def index
  	@tenants = Tenant.all
  end

  def create
  	@tenant = Tenant.new(:usage)
  end
end
