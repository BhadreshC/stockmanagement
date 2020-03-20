json.extract! product, :id, :tittle, :description, :created_at, :updated_at
json.url product_url(product, format: :json)
