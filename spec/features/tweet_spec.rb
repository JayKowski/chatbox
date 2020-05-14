require 'rails_helper'
require 'capybara/rails'

RSpec.feature "Tweets", type: :feature do
  let(:user_valid) do
    has_x = { username: 'abednego', full_name: 'sir abednego' }
    has_x
  end

  scenario 'user can reply to a tweet' do
    user = User.create(user_valid)
    visit signin_path

    fill_in 'Username', with: user.username
    find('[type=submit]').click

    user.tweets.create(tweet_body: 'this is a test tweet')
    tweet = user.tweets.create(tweet_body: 'this is a test tweet')
    visit tweet_path(tweet)
    example_reply = 'this is a new reply'
    fill_in 'reply', with: example_reply
    click_button 'reply'
    visit tweet_path(tweet)
    expect(page).to have_content(example_reply)
  end
end
