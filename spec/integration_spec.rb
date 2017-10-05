require "capybara/rspec"
require "./app"
require "pry"
require('spec_helper')

Capybara.app = Sinatra::Application
set(:show_exceptions, false)


describe 'the store creation path', {:type => :feature} do
  it 'takes the user to the homepage where they can add a store' do
    visit '/'
    click_link('Add a new Store')
    expect(page).to have_content('Store Info')
  end

  it 'takes the user to the add store page' do
    visit '/add_store'
    fill_in('store_name', :with => 'Walmart')
    click_button('Save')
    expect(page).to have_content('List of Stores:')
  end
end

describe 'the shoe creation path', {:type => :feature} do
  it 'takes the user to the homepage where they can add a shoe' do
    visit '/'
    click_link('Add New Shoe')
    expect(page).to have_content('Add a shoe!')
  end
  it 'takes the user to the add shoe page' do
    visit '/add_shoe'
    fill_in('shoe_name', :with => 'Flip Flops')
    fill_in('price', :with => '25')
    click_button('Add')
    expect(page).to have_content('List of Stores:')
  end
end


describe 'individual store' , {:type => :feature} do
  it 'list all of the shoes in a store' do
    store1 = Store.create({:name => "Cabelas"})
    shoe1 = Shoe.create({:name => "Nike", :price => 100.00})
    shoe2 = Shoe.create({:name => "Puma", :price => 50.00})
    visit '/'
    click_link('Cabelas')
    expect(page).to have_content('Cabelas has these shoes for these prices:')
  end

  it 'add existing shoes to this store' do
    visit '/'
    click_link('Cabelas')
    click_button('Add')
    expect(page).to have_content('Nike')
  end

  it 'list all of the shoes in a store' do
    visit '/'
    click_link('Cabelas')
    expect(page).to have_content('Nike')
  end
end