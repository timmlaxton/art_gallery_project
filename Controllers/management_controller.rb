require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/artist')
require_relative('../models/exhibition')

also_reload('./models/*')

get '/manager/artists' do
  Artist.all
  @artists = Artist.all()
  erb(:"manager/artist/index")
end


get '/manager/artists/new' do
erb(:"manager/artist/new")
end

get '/manager/exhibitions/new' do
  erb(:"manager/exhibition/new")
end

get '/manager/exhibitions/:id' do
  @exhibition = Exhibition.find(params[:id])
  erb(:"manager/exhibition/show")
end

post '/manager/artists' do
  @artist = Artist.new(params)
  @artist.save()
  erb(:"manager/artist/create")
end

get '/manager/artists/:id' do
  @artist = Artist.find(params[:id])
  erb(:"manager/artist/show")
end

get '/manager/artists/:id/edit' do
  @artist = Artist.new(params[:id])
  erb(:"manager/artist/edit")
end

get '/manager/artists/:id/edit' do
  @artist = Artist.find(params['id'])
  erb(:'manager/artist/edit')
end

post '/manager/artists/:id/delete' do
    artist = Artist.find(params['id'])
    artist.delete
    redirect to '/artist'
end

  post '/manager/artists/:id/edit' do
    @artist = Artist.new(params)
    @artist.update()
    erb(:"manager/artist/update")
  end


  get '/manager/exhibitions' do
  Exhibition.all
  @exhibitions = Exhibition.all()
  erb(:"manager/exhibition/index")
  end

  get '/manager/exhibitions/:id/edit' do
  @exhibition = Exhibition.find(params[:id])
  erb(:"manager/exhibition/edit")
  end


  post '/manager/exhibitions' do
  @exhibition = Exhibition.new(params)
  @exhibition.save()
  erb(:"manager/exhibition/create")
  end


  post '/manager/exhibitions/:id/delete' do
  @exhibition = Exhibition.find(params['id'])
  @exhibition.delete
  redirect to '/manager'
  end



  get '/manager/exhibitions/:id/edit' do
  @exhibition = Exhibition.find(params["id"])
  erb(:"manager/exhibition/edit")
  end


  post '/manager/exhibitions/:id/edit' do
  @exhibition = Exhibition.new(params)
  @exhibition.update()
  erb(:"manager/exhibition/update")
  end
