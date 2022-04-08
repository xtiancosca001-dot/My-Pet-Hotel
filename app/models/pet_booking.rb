class PetBooking < ApplicationRecord
  include Visible
  belongs_to :pet
end
