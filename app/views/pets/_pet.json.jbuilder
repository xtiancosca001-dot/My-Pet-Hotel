json.extract! pet, :id, :pet_name, :pet_type, :owner_id, :created_at, :updated_at
json.url owner_pet_url(pet, format: :json)
