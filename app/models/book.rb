class Book < ApplicationRecord
  
  has_one_attached :image  #Bookモデルにimageを持たせる(ActiveStorage)
  belongs_to :user  #アソシエーション

  

end


