require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { 
    User.create(
      username: 'rspec', 
      fullname: 'rspec test', 
      photo: Rack::Test::UploadedFile.new('spec/support/test_image.png', 'image/png'),
      coverimage: Rack::Test::UploadedFile.new('spec/support/test_image.png', 'image/png')
    ) 
  }
  let(:inv_user) { User.create(username: '', fullname: 'rspec test', photo: '', coverimage: '') }
  let(:inv_user1) { User.create(username: 'rspec', fullname: '', photo: '', coverimage: '') }
  let(:opinions) { User.reflect_on_association(:opinions).macro }
  let(:followers) { User.reflect_on_association(:followers).macro }
  let(:inverse_followers) { User.reflect_on_association(:inverse_followers).macro }
  let(:friend_requests) { User.reflect_on_association(:friend_requests).macro }

  it 'checks if creating user is correct' do
    expect(user).to be_valid
  end

  it 'check user username presence' do
    expect(inv_user).to_not be_valid
  end

  it 'check user fullname presence' do
    expect(inv_user).to_not be_valid
  end

  it 'check correct association between opinions and user' do
    expect(opinions).to eq(:has_many)
  end

  it 'check correct association between followers and user' do
    expect(followers).to eq(:has_many)
  end

  it 'check correct association between inverse_followers and user ' do
    expect(inverse_followers).to eq(:has_many)
  end
end
