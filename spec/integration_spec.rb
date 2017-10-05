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

describe 'the shoe creation path',  {:type => :feature} do
it 'takes the user to the homepage where they can add a shoe' do
    visit '/'
    click_link('Add New Shoe')
    expect(page).to have_content('Add a shoe!')
  end
end
