require 'redis'
require 'uri'
require "active_support/core_ext/string/conversions"

url = URI.parse ENV["REDIS_CLOUD"]
redis = Redis.new host: url.host, port: url.port, password: url.password
puts "Redis subscriber running"

Thread.new do
	redis.subscribe "KUAS_TEST" do |on|
	  on.message do |event, data|

	  	p Time.now.to_f - data["time"].to_time.to_f
	  end
	end
end

puts "rails continues loading"