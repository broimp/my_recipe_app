class RecipeAppsController < ApplicationController
  before_action :set_recipe_app, only: [:show, :edit, :update, :destroy]

  # GET /recipe_apps
  # GET /recipe_apps.json
  def index
    @recipe_apps = RecipeApp.all
  end

  # GET /recipe_apps/1
  # GET /recipe_apps/1.json
  def show
  end

  # GET /recipe_apps/new
  def new
    @recipe_app = RecipeApp.new
  end

  # GET /recipe_apps/1/edit
  def edit
  end

  # POST /recipe_apps
  # POST /recipe_apps.json
  def create
    @recipe_app = RecipeApp.new(recipe_app_params)

    respond_to do |format|
      if @recipe_app.save
        format.html { redirect_to @recipe_app, notice: 'Recipe app was successfully created.' }
        format.json { render :show, status: :created, location: @recipe_app }
      else
        format.html { render :new }
        format.json { render json: @recipe_app.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipe_apps/1
  # PATCH/PUT /recipe_apps/1.json
  def update
    respond_to do |format|
      if @recipe_app.update(recipe_app_params)
        format.html { redirect_to @recipe_app, notice: 'Recipe app was successfully updated.' }
        format.json { render :show, status: :ok, location: @recipe_app }
      else
        format.html { render :edit }
        format.json { render json: @recipe_app.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipe_apps/1
  # DELETE /recipe_apps/1.json
  def destroy
    @recipe_app.destroy
    respond_to do |format|
      format.html { redirect_to recipe_apps_url, notice: 'Recipe app was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe_app
      @recipe_app = RecipeApp.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recipe_app_params
      params.require(:recipe_app).permit(:page, :dish, :ingredient_1, :ingredient_2, :ingredient_3)
    end
end
