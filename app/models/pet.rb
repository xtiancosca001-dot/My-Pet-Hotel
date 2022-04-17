class Pet < ApplicationRecord
  belongs_to :owner
  has_many :bookings, inverse_of: :pet
  accepts_nested_attributes_for :bookings, reject_if: lambda {
    |attributes| attributes['start_date'].blank?
  }, allow_destroy: true
end
