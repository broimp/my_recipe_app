class RecipeAppsController < ApplicationController
  before_action :set_recipe_app, only: [:edit, :update]

  # GET /recipe_apps/new
  def new
#    RecipeApp.delete_all
    @recipe_app = RecipeApp.new
  end

  # GET /recipe_apps/1/edit
  def edit
  end

  # POST /recipe_apps
  def create
    @recipe_app = RecipeApp.new(recipe_app_params)
    if @recipe_app.save
      RecipeApp.cleaner(@recipe_app.created_at.to_s.slice(5,2))
      redirect_to recipe_apps_path
    else
      render :new
    end
  end

  # PATCH/PUT /recipe_apps/1
  def update
    if @recipe_app.update(recipe_app_params)
      redirect_to recipe_apps_path
    else
      render :edit
    end
  end

  #  # Runs after new or edit, and picks up latest set of food values off recipe_app record
  def index
    @recipe_app = RecipeApp.last
    @page = @recipe_app.page
    @dish = @recipe_app.dish
    @ingredients = "#{@recipe_app.ingredient_1},#{@recipe_app.ingredient_2},#{@recipe_app.ingredient_3}"
    @recipe_apps = RecipeApp.api_records(@page, @dish, @ingredients)

    unless @recipe_apps[0]
      redirect_to new_recipe_app_path, notice: 'Selection values did not produce any recipe hits.'
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_recipe_app
    @recipe_app = RecipeApp.find(params[:id])
  end

  def recipe_app_params
    params.require(:recipe_app).permit(:page, :dish, :ingredient_1, :ingredient_2, :ingredient_3)
  end
end
