class Rack::Attack
  limit_proc = proc { |req| 100 }
  period_proc = proc { |req| 10.seconds }
  Rack::Attack.throttle('req/ip', :limit => limit_proc, :period => period_proc) do |req|
    Rails.logger.info "limit reached!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
  end
end