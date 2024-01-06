class Subpost < ApplicationRecord
  belongs_to :user
  belongs_to :post
  validates :body, presence: true, uniqueness: { case_sensitive: false }
end
