require './environment'

module FormsLab
  class App < Sinatra::Base
    get '/' do
      erb :root
    end

    get '/new' do
      erb :"pirates/new"
    end

    post '/pirates' do
      pirate_hash = params["pirate"]
      ship_hash1 = params["pirate"]["ships"][0]
      ship_hash2 = params["pirate"]["ships"][1]
      @pirate = Pirate.new(pirate_hash["name"], pirate_hash["weight"], pirate_hash["height"])
      @ship1 = Ship.new(ship_hash1["name"], ship_hash1["type"], ship_hash1["booty"])
      @ship2 = Ship.new(ship_hash2["name"], ship_hash2["type"], ship_hash2["booty"])
      erb :"pirates/show"
    end
  end
end
