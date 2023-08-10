class Book < ApplicationRecord


  belongs_to :user  #アソシエーション
  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true
  validates :body, length: { maximum: 200 }

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  def favorites_count
    favorites.count
  end

end


