class Tweet < ApplicationRecord
    #validations
    validates :tweet_body, presence: true, length: { minimum: 5, maximum: 255 }

    #Associations
    belongs_to :author, class_name: "User", foreign_key: 'author_id'
    has_many :replies
    scope :ordered_by_most_recent, -> { order(created_at: :desc) }
end
