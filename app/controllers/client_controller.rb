class ClientController < ApplicationController
  def show
  	@client = Client.new.post({"event"=> {"name"=> "test"}})
  end
end
