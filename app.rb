require("bundler/setup")
require 'pry'
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/shoes')do
  erb(:shoes)
end

get('/')do
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

get('/delete_store')do
  erb(:stores)
end

get('/delete_shoe')do
  erb(:shoes)
end

get('/edit_store')do
  erb(:edit_store)
end

get('/update_shoe')do
  erb(:shoes)
end
