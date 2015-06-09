class Client < ActiveRecord::Base

	BASE_URL = "http://ancient-bastion-4312.herokuapp.com/events.json/"

	def post(body)
		Curl.post(BASE_URL, body.to_json) do |http|
		  http.headers['Content-Type'] = 'application/json'
		end
	end
end
