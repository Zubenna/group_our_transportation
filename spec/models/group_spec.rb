require 'rails_helper'

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end

RSpec.describe Group, type: :model do
  before :each do
    @user = User.create(first_name: 'Daniel', last_name: 'Eze', email: 'd.email@example.com',
                        username: 'melody')
    @transportation = Transportation.create(author_id: 1, name: 'Bus', distance: 10)
  end

  describe 'associations' do
    it { should belong_to(:author) }
    it { should have_many(:transportations) }
  end

  describe 'validations' do
    it { should validate_presence_of(:icon) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:author_id) }
  end
end
