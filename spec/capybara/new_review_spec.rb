require 'rails_helper'

RSpec.describe 'ROR-Social Scaffold', type: :system do
  describe 'signUp' do
    scenario 'signup a new user' do
      visit 'users/new'
      fill_in :user_username, with: 'Capybara'
      fill_in :user_fullname, with: 'capybara test'
      find('input[name="commit"]').click
      fill_in :opinion_text, with: 'capybara new review test'
      find('input[name="commit"]').click
      expect(page).to have_content('capybara new review test')
    end
  end
end
