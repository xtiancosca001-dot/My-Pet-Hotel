class Owner < ApplicationRecord
    has_many :pets, dependent: :destroy
end
