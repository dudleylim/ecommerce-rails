class Seller < ApplicationRecord
    has_many :sales
    has_secure_password

end
