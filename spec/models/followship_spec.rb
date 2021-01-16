require 'rails_helper'

RSpec.describe Followship, type: :model do
  let(:user1) { User.create(username: 'rspec1', fullname: 'rspec1 test') }
  let(:user2) { User.create(username: 'rspec2', fullname: 'rspec2 test') }
  let(:followship) { Followship.create(user_id: user1.id, follower_id: user2.id, blocked: false) }
  let(:inv_followship) { Followship.create(user_id: '', follower_id: user1.id, blocked: false) }
  let(:user) { Followship.reflect_on_association(:user).macro }
  let(:follower) { Followship.reflect_on_association(:follower).macro }

  it 'checks if creating followship is correct' do
    expect(followship).to be_valid
  end

  it 'check for not valid followship' do
    expect(inv_followship).to_not be_valid
  end

  it 'check correct association between user and followships' do
    expect(user).to eq(:belongs_to)
  end

  it 'check correct association between follower and followships' do
    expect(follower).to eq(:belongs_to)
  end
end
