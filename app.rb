require('sinatra')
require('sinatra/contrib/all')
require('pry')
require_relative('./models/artist')
require_relative('./models/exhibition')
also_reload('./models/*')

get '/pizza-orders' do
  @orders = PizzaOrder.all()
  erb(:index)
end
