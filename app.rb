require("bundler/setup")
require 'pry'
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }


get('/create_fake_data') do
  Store.create({:name => "Store Washington Square"})
  Store.create({:name => "Store Union Square"})
  Store.create({:name => "Store Alabama Square"})
  redirect('/')
end

get('/')do
  @stores = Store.all()
  erb(:stores)
end

get('/edit_store/:id')do
  @store = Store.find(params["id"])
  erb(:edit_store)
end

post('/edit_store')do
  if params["store_id"]!=''
    @store = Store.find(params["store_id"])
    @store.update({:name =>  params['store_name']})
  else
    Store.create({:name => params['store_name']})
  end
  redirect('/')
end

get('/add_store')do
  @store = Store.new()
  erb(:edit_store)
end

get('/add_shoe')do
  erb(:add_shoe)
end

post('/add_shoe')do
  Shoe.create({:name => params['shoe_name'],:price => params['price']})
  redirect('/')
end

get('/individual_store')do
  @shoes = Shoe.all()
  erb(:individual_store)
end

get('/delete_store/:id')do
  Store.destroy(params[:id])
  redirect('/')
end


