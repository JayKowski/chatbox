# frozen_string_literal: true

class Reply < ApplicationRecord
  # validations
  validates :reply_body, presence: true, length: { minimum: 5, maximum: 255 }

  # Associations
  belongs_to :user
  belongs_to :tweet
end
