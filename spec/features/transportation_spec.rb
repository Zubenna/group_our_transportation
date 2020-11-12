require 'rails_helper'
RSpec.describe 'Transportation', type: :feature do
  before(:each) do
    @user = User.create(first_name: 'Daniel', last_name: 'Eze', email: 'd.email@example.com',
                      username: 'melody')
    visit root_path
    click_link 'Log in'
    fill_in 'username', with: 'melody'
    click_button 'Login'
  end
  it 'User should create transportation' do
    click_link 'All my transportations'
    click_link 'Add Transportation'
    fill_in 'transportation[name]', with: 'Car'
    fill_in 'transportation[distance]', with: 10
    click_button 'Create'
    expect(page).to have_content('Transportation created successfully')
  end
  it 'User should create transportation' do
    click_link 'All my ungrouped transportations'
    click_link 'Add Transportation'
    fill_in 'transportation[name]', with: 'Car'
    fill_in 'transportation[distance]', with: 10
    click_button 'Create'
    expect(page).to have_content('Transportation created successfully')
  end
end
