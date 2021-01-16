require 'rails_helper'

RSpec.describe Opinion, type: :model do
  let(:user1) { User.create(username: 'RSpec', fullname: 'rspec test') }
  let(:opinion) { Opinion.create(author_id: user1.id, text: 'test post content por Rspec') }
  let(:inv_opinion) { Opinion.create(author_id: user1.id, text: '') }
  let(:inv_opinion1) { Opinion.create(author_id: user1.id, text: 'ab') }
  let(:author) { Opinion.reflect_on_association(:author).macro }

  it 'checks if creating opinion is correct' do
    expect(opinion).to be_valid
  end

  it 'check opinion text presence' do
    expect(inv_opinion).to_not be_valid
  end

  it 'check opinion text length' do
    expect(inv_opinion1).to_not be_valid
  end

  describe 'associations' do
    it { should belong_to(:author).class_name('User').with_foreign_key('author_id') }
  end
end
