require 'rails_helper'
RSpec.describe User, type: :model do
  user = User.create(first_name: 'Daniel', last_name: 'Eze', email: 'd.email@example.com', username: 'melody')
  it 'first_name must be present' do
    user.first_name = nil
    expect(user).to_not be_valid
  end
  it 'last_name must be present' do
    user.last_name = nil
    expect(user).to_not be_valid
  end
  it 'email must be present' do
    user.email = nil
    expect(user).to_not be_valid
  end
  it 'username must be present' do
    user.username = nil
    expect(user).to_not be_valid
  end
  it 'All parameters must have values' do
    user.first_name = 'Daniel'
    user.last_name = 'Eze'
    user.email = 'za.email@example.com'
    user.username = 'franco'
    expect(user).to be_valid
  end
  it 'checks email uniquness' do
    user3 = User.create(first_name: 'Dan', last_name: 'Umeh', email: 'd.email@example.com', username: 'doncope')
    expect(user3.valid?).to eql(false)
  end
  it 'checks username uniqueness' do
    user3 = User.create(first_name: 'Dan', last_name: 'Umeh', email: 'd.email@example.com', username: 'dencos')
    expect(user3.valid?).to eql(false)
  end
end
