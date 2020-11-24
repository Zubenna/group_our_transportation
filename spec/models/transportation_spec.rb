require 'rails_helper'

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end

RSpec.describe Transportation, type: :model do
  before :each do
    @user = User.create(first_name: 'Daniel', last_name: 'Eze', email: 'd.email@example.com',
                        username: 'melody')
  end

  describe 'associations' do
    it { should belong_to(:author) }
    it { should have_many(:groups) }
  end

  describe 'validations' do
    subject { Transportation.create(author_id: 1, name: 'Bus', distance: 10) }
    it { should validate_presence_of(:distance) }
    it { should validate_presence_of(:name) }
  end
end
