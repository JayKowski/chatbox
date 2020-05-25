# frozen_string_literal: true

class User < ApplicationRecord
  # validations

  validates :username, presence: true, length: { minimum: 3, maximum: 15 }
  validates :full_name, presence: true, length: { minimum: 6, maximum: 25 }
  validates :prof_photo, presence: true
  validates :cover_photo, presence: true

  # associations

  has_many :tweets, foreign_key: 'author_id'
  has_many :replies

  has_many :followed_users, foreign_key: :follower_id, class_name: 'Follow'
  has_many :followees, through: :followed_users

  has_many :following_users, foreign_key: :followee_id, class_name: 'Follow'
  has_many :followers, through: :following_users

  has_one_attached :prof_photo
  has_one_attached :cover_photo

  # rubocop:disable Lint/UselessAssignment
  def to_follow
    users = User.all
    follow = users.map(&:id) - followers.map(&:id)
    followers = User.where(id: follow) - User.where(id: id)
    # follows -= User.where(id: id)
  end
  # rubocop:enable Lint/UselessAssignment

  def following?(follower)
    followees.include?(follower)
  end

  def avatar
    pic = 'https://cdn.shopify.com/s/files/1/0882/5118/products/Rick-and-Morty-Ricks-Face-Enamel-Pin-2186592_1024x1024.jpg?v=1481411776'
    return self.photo = pic unless photo.nil?
  end

  def cover_image
    cover = 'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/rick-and-morty-season-4-summer-1576748877.jpg?crop=1xw:0.9940357852882704xh;center,top&resize=768:*'
    return self.cover_image = cover unless cover_image.nil?
  end
end
