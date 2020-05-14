class User < ApplicationRecord
    #validations

    validates :username, presence: true, length: { minimum: 3, maximum: 15 }
    validates :full_name, presence: true, length: { minimum: 6, maximum: 25 }
    validates :prof_photo, presence: true
    validates :cover_photo, presence: true

    #associations
    
    has_many :tweets, foreign_key: "author_id"
    has_many :replies

    has_many :followed_users, foreign_key: :follower_id, class_name: 'Follow'
    has_many :followees, through: :followed_users

    has_many :following_users, foreign_key: :followee_id, class_name: 'Follow'
    has_many :followers, through: :following_users

    has_one_attached :prof_photo
    has_one_attached :cover_photo

    def to_follow
        users = User.all
        follow = users.map(&:id) - followers.map(&:id)
        follows = User.where(id: follow)
        follow_ids = follows - User.where(id: self.id)
    end

    def following?(f)
        followees.include?(f)
    end

    def avatar
        self.photo = 'https://cdn.shopify.com/s/files/1/0882/5118/products/Rick-and-Morty-Ricks-Face-Enamel-Pin-2186592_1024x1024.jpg?v=1481411776' if photo.nil?
    end

    def cover_image
        self.cover_image = "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/rick-and-morty-season-4-summer-1576748877.jpg?crop=1xw:0.9940357852882704xh;center,top&resize=768:*" if photo.nil?
    end
end