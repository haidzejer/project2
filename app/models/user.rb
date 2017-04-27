class User < ApplicationRecord
  has_secure_password
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :hearts, dependent: :destroy

  validates :user_id, uniqueness: { scope: :post_id }

  def heart!(post)
    self.hearts.create!(post_id: post.id)
  end
  def unheart!(post)
    heart = self.hearts.find_by_post_id(post.id)
    heart.destroy!
  end
  def heart?(post)
    self.hearts.find_by_post_id(post.id)
  end
end
