class Pet < ApplicationRecord
  include Visible 
  
  belongs_to :owner
  has_many :pet_bookings, dependent: :destroy
end
