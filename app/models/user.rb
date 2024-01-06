class User < ApplicationRecord
    has_many :posts
    has_many :subposts
    validates :username, presence: true, uniqueness: { case_sensitive: false }
end
