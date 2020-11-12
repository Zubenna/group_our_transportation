require 'rails_helper'
RSpec.describe 'User', type: :feature do
  it 'It should create a new user' do
    visit new_user_path
    fill_in 'user_first_name', with: 'Precious'
    fill_in 'user_last_name', with: 'Ibe'
    fill_in 'user_email', with: 'i.email@example.com'
    fill_in 'user_username', with: 'zubenna'
    find("input[type='submit']").click
    expect(page).to have_content('User created successfuly. Please, login')
  end

  it 'It should sign in a user' do
    @user = User.create(first_name: 'Daniel', last_name: 'Eze', email: 'd.email@example.com',
                      username: 'melody')
    visit visit root_path
    click_link 'Log in'
    fill_in 'username', with: 'melody'
    click_button 'Login'
    expect(page).to have_content('You have logged in successfully')
  end
  it 'It should log out successfully' do
    @user = User.create(first_name: 'Daniel', last_name: 'Eze', email: 'd.email@example.com',
                        username: '')
    visit visit root_path
    click_link 'Log in'
    fill_in 'username', with: 'melody'
    click_button 'Login'
    click_link 'Log Out'
    expect(page).to have_content('You have logged out successfully')
  end
end
