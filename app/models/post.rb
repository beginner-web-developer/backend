class Post < ApplicationRecord
  belongs_to :user
  has_many :subposts
  validates :title, presence: true, uniqueness: { case_sensitive: false }
end
