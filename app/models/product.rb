class Product < ApplicationRecord
    belongs_to :category
    has_many :sales
    validates :name, presence: true
    validates :description, presence: true
    validates :category_id, presence: true
end
