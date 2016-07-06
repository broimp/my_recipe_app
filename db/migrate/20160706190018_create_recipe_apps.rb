class CreateRecipeApps < ActiveRecord::Migration[5.0]
  def change
    create_table :recipe_apps do |t|
      t.string :page
      t.string :dish
      t.string :ingredient_1
      t.string :ingredient_2
      t.string :ingredient_3

      t.timestamps
    end
  end
end
