require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) do
    User.create(
      username: 'rspec',
      fullname: 'rspec test',
      photo: Rack::Test::UploadedFile.new('spec/support/test_image.png', 'image/png'),
      coverimage: Rack::Test::UploadedFile.new('spec/support/test_image.png', 'image/png')
    )
  end
  let(:inv_user) { User.create(username: '', fullname: 'rspec test', photo: '', coverimage: '') }
  let(:inv_user1) { User.create(username: 'rspec', fullname: '', photo: '', coverimage: '') }
  let(:opinions) { User.reflect_on_association(:opinions).macro }
  let(:followers) { User.reflect_on_association(:followers).macro }
  let(:inverse_followers) { User.reflect_on_association(:inverse_followers).macro }
  let(:friend_requests) { User.reflect_on_association(:friend_requests).macro }

  it 'checks if creating user is correct' do
    expect(user).to be_valid
  end

  describe 'validations' do
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:fullname) }
    it { should validate_uniqueness_of(:username) }
    it { should validate_length_of(:username).is_at_least(3) }
    it { should validate_length_of(:fullname).is_at_least(5) }
  end

  describe 'associations' do
    it { should have_many(:opinions).class_name('Opinion').with_foreign_key('author_id') }
    it { should have_many(:followers).class_name('Followship').with_foreign_key('user_id') }
    it { should have_many(:inverse_followers).class_name('Followship').with_foreign_key('follower_id') }
  end
end
