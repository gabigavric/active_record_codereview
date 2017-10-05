require("bundler/setup")
require 'pry'
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }


get('/create_fake_data') do
  store1 = Store.create({:name => "Store1"})
  store2 = Store.create({:name => "Store2"})
  store3 = Store.create({:name => "Store3"})
  shoe1 = Shoe.create({:name => "Nike", :price => 100})
  shoe2 = Shoe.create({:name => "Nike1", :price => 101})
  shoe3 = Shoe.create({:name => "Nike2", :price => 102})
  shoe4 = Shoe.create({:name => "Nike2", :price => 100})
  store1.inventories.create({:store => store1, :shoe => shoe1})
  store1.inventories.create({:store => store1, :shoe => shoe2})
  store1.inventories.create({:store => store1, :shoe => shoe3})
  store1.inventories.create({:store => store1, :shoe => shoe4})
  store2.inventories.create({:store => store2, :shoe => shoe1})
  store2.inventories.create({:store => store2, :shoe => shoe2})
  store3.inventories.create({:store => store3, :shoe => shoe3})
  store3.inventories.create({:store => store3, :shoe => shoe4})
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
  redirect '/'
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
  redirect '/'
end

get('/individual_store/:store_id')do
  @store = Store.find(params["store_id"])
  @shoes = Shoe.all()
  erb(:individual_store)
end

post('/individual_store')do
  store = Store.find(params["store_id"])
  store.inventories.create({:store => store, :shoe => Shoe.find(params["shoe_id"])})
  redirect "/individual_store/#{store.id}"

end

get('/delete_store/:id')do
  Store.destroy(params[:id])
  redirect '/'
end


