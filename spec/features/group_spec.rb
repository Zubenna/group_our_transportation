require 'rails_helper'
RSpec.describe 'Group', type: :feature do
  before(:each) do
    @user = User.create(first_name: 'Daniel', last_name: 'Eze', email: 'd.email@example.com',
                        username: 'melody')
    visit root_path
    click_link 'Log in'
    fill_in 'username', with: 'melody'
    click_button 'Login'
  end
  it 'User should create a Group' do
    click_link 'Different means of transportations'
    click_link 'Create New'
    expect(page).to have_content('New Group')
  end
end
