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
