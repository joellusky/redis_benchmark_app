require 'redis'
require 'benchmark'
require 'uri'
require './app/models/client'
require 'curb'
require 'active_support'
require 'json'

url = URI.parse ENV["REDIS_CLOUD"]
redis = Redis.new host: url.host, port: url.port, password: url.password

client = Client.new
trials = 1000

Benchmark.bm do |x|
  x.report do 
  	trials.times do
  		redis.publish "KUAS_TEST", {"name"=> "test"}
  	end
  end
  x.report do
  	trials.times do
  		client.post({"event"=> {"name"=> "test"}})
  	end
  end
end