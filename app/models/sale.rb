class Sale < ApplicationRecord
    belongs_to :product
    belongs_to :buyer, optional: true
    belongs_to :seller
end
