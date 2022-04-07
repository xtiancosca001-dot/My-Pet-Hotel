class Owner < ApplicationRecord
    include Visible 
    has_many :pets
end
