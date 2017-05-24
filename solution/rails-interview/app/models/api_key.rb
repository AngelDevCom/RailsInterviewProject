class ApiKey < ActiveRecord::Base
  before_create :generate_access_token

  belongs_to :tenant

  private 
  def self.clear_tenant_access_tokens(tenant)
    ApiKey.where(tenant: tenant).destroy_all
  end

  def generate_access_token 
    begin
      self.access_token = SecureRandom.hex
    end while self.class.exists?(access_token: access_token)
  end
end
