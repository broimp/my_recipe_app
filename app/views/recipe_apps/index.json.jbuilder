json.array!(@recipe_apps) do |recipe_app|
  json.extract! recipe_app, :id, :page, :dish, :ingredient_1, :ingredient_2, :ingredient_3
  json.url recipe_app_url(recipe_app, format: :json)
end
