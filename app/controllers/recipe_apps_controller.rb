class RecipeAppsController < ApplicationController
  before_action :set_recipe_app, only: [:show, :edit, :update]

  # GET /recipe_apps/1
  # Note: There is no show view. This accomodates rails default routing to the show
  # view after a create record, and redirects to the index view.
  def show
    redirect_to recipe_apps_path
  end

  # GET /recipe_apps/new
  def new
    RecipeApp.delete_all
    @recipe_app = RecipeApp.new
  end

  # GET /recipe_apps/1/edit
  def edit
  end

  # POST /recipe_apps
  def create
    @recipe_app = RecipeApp.new(recipe_app_params)

    respond_to do |format|
      if @recipe_app.save
        format.html { redirect_to @recipe_app }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /recipe_apps/1
  def update
    respond_to do |format|
      if @recipe_app.update(recipe_app_params)
        format.html { redirect_to @recipe_app }
      else
        format.html { render :edit }
      end
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
      redirect_to new_recipe_app_path, notice: 'Selection values did not produce any recipe_apps.'
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
