require("bundler/setup")
require 'pry'
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/brands')do
  erb(:brands)
end

get('/stores')do
  erb(:stores)
end

get('/add_store')do
  erb(:add_store)
end

get('/add_brand')do
  erb(:add_brand)
end

get('/individual_store')do
  erb(:individual_store)
end

get('/delete_store')do
  erb(:stores)
end

get('/delete_brand')do
  erb(:brands)
end

get('/update_store')do
  erb(:stores)
end

get('/update_brand')do
  erb(:brands)
end
