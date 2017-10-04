require("bundler/setup")
require 'pry'
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }


get('/create_fake_data') do
  Store.create({:name => "Store Washington Square"})
  Store.create({:name => "Store Union Square"})
  Store.create({:name => "Store Alabama Square"})
end

get('/')do
  @stores = Store.all()
  erb(:stores)
end

get('/add_store')do
  erb(:edit_store)
end

get('/add_shoe')do
  erb(:add_shoe)
end

get('/individual_store')do
  erb(:individual_store)
end

get('/delete_store/:id')do
  Store.destroy(params[:id])

end


get('/edit_store')do
  erb(:edit_store)
end

