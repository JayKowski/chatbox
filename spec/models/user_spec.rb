# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { should have_many(:tweets) }
    it { should have_many(:replies) }
    it { should have_many(:followed_users) }
    it { should have_many(:followees) }
    it { should have_many(:following_users) }
    it { should have_many(:followers) }
  end
end
