class DashboardController < ApplicationController 
  def index 
    @questions = Question.all.joins(:answers)
    @users = User.all
    @tenants = Tenant.all
    @answers = Answer.all
    @total_tenant_count = total_tenant_count
  end

  private
  def total_tenant_count 
    Tenant.sum(:request_count)
  end
end