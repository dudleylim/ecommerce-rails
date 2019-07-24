class Sale < ApplicationRecord
    belongs_to :product
    belongs_to :buyer, optional: true
    belongs_to :seller
    validates :seller_id, presence: true
    validates :price, presence: true
    validates :category_id, presence: true
end
