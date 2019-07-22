class Sale < ApplicationRecord
    belongs_to :product
    belongs_to :buyer
    belongs_to :seller
end
