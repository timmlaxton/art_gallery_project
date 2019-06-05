require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/artist')
require_relative('../models/exhibition')
also_reload('./models/*')

get "/visitor/artists" do
  Artist.all
  @artists = Artist.all()
  erb (:"visitor/artists/index")
end

get "/visitor/artists/:id" do
  @artist = Artist.find(params["id"])
  erb (:"visitor/artists/show")
end

get "/visitor/exhibition/:id" do
  @exhibit =Exhibit.find(params["id"])
  erb (:"visitor/exhibition/show")
end

get "/visitor/exhibition" do
  @exhibitions = Exhibit.all()
  @artists = Artist.all()
  erb (:"visitor/exhibitions/index")
end

get "/visitor/exhibition/artist" do
if params["id"] == "all"
  redirect to "/exhibitions"
end
@artists = Artist.all()
@artist = Artist.find(params["id"])
@exhibits = @artist.exhibit()
erb (:"visitor/exhibitions/show")
end
