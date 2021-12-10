class RecipesController < ApplicationController
  before_action :current_business_account_must_be_recipe_chef, only: [:edit, :update, :destroy] 

  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  # GET /recipes
  def index
    @recipes = Recipe.all
  end

  # GET /recipes/1
  def show
    @order = Order.new
    @recipe_menu_join = RecipeMenuJoin.new
    @recipe_ingredient_join = RecipeIngredientJoin.new
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
  end

  # GET /recipes/1/edit
  def edit
  end

  # POST /recipes
  def create
    @recipe = Recipe.new(recipe_params)

    if @recipe.save
      message = 'Recipe was successfully created.'
      if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referrer, notice: message
      else
        redirect_to @recipe, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /recipes/1
  def update
    if @recipe.update(recipe_params)
      redirect_to @recipe, notice: 'Recipe was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /recipes/1
  def destroy
    @recipe.destroy
    message = "Recipe was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to recipes_url, notice: message
    end
  end


  private

  def current_business_account_must_be_recipe_chef
    set_recipe
    unless current_business_account == @recipe.chef
      redirect_back fallback_location: root_path, alert: "You are not authorized for that."
    end
  end

    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def recipe_params
      params.require(:recipe).permit(:business_id, :recipe_name, :recipe_description)
    end
end
