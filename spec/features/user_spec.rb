require 'rails_helper'
require 'capybara/rails'

RSpec.feature 'Users', type: :feature do
  let(:user_valid) do
    has_x = { username: 'jay', full_name: 'jay kowski' }
    has_x
  end

  scenario 'User registers succesfully' do
    visit sign_up_path
    expect do
      fill_in 'Username', with: user_valid[:username]
      fill_in 'Full name', with: user_valid[:full_name]
      click_button 'Sign up'
    end.to change(User, :count).by(1)
    user = User.last
    expect(user.username).to eq(user_valid[:username])
  end

  scenario 'User profile displays properly' do
    user = User.create(user_valid)
    visit signin_path

    fill_in 'Username', with: user.username
    click_button 'Log in'
    Tweet.create(author_id: user.id, tweet_body: 'Lorem Impsum')
    visit user_path(user)
    expect(page).to have_content user.username
    expect(page).to have_content user.tweets.last.tweet_body
  end
end
