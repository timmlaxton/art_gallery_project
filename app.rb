require('sinatra')
require('sinatra/contrib/all')
require('pry')
require_relative('./models/artist')
require_relative('./models/exhibition')
require_relative('./Controllers/management_controller')
require_relative('./Controllers/visitor_controller')
also_reload('./models/*')

get '/' do
  @artists = Artist.all()
  @exhibitions = Exhibition.all()
  erb(:"visitor/artists/index")
end


get '/exhibition' do
  @artists = Artist.all()
  @exhibitions = Exhibition.all()
  erb(:"manager/exhibition/index")
end


get '/artist' do
  @artists = Artist.all()
  @exhibitions = Exhibition.all()
  erb(:"manager/artist/index")
end


# get '/visitor' do
#   @artists = Artist.all()
#   @exhibitions = Exhibition.all()
#   (erb:"visitor/artist/index")
# end
