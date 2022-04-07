class Pet < ApplicationRecord
  include Visible 
  
  belongs_to :owner
end
