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
end

