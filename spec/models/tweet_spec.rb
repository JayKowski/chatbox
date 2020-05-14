require 'rails_helper'

RSpec.describe Tweet, type: :model do
  describe 'associations' do
    it { should belong_to(:author) }
    it { should have_many(:replies) }
  end
end
